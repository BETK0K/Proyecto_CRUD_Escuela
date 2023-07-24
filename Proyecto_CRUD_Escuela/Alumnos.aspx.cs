using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_CRUD_Escuela
{
    public partial class Alumnos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btGuardar_Click(object sender, ImageClickEventArgs e)
        {
            /*Declaració de variables de Acceso a Base de Datos*/
            string SQLInsert;
            SqlConnection SQLCon = new SqlConnection("Data Source=DESKTOP-D7LCB5J; Initial Catalog=Escuela; Integrated Security=True");
            SqlCommand SQLCmd = new SqlCommand();



            using (SQLCon)
            {
                SQLCon.Open();//Abre la base de datos olivos//
                SQLCmd.Connection = SQLCon;

                //Declaración de variables para la asignación de los valores que el usuario ingresa en los controles del formulario//
                string AMatricula, ANombre, AApellido, ATelefono, ACarrera;

                //Asignar los valores a su variable correspondiente//     
                AMatricula = tbMatricula.Text;
                ANombre = tbNombre.Text;
                AApellido = tbApellidos.Text;
                ATelefono = tbTelefono.Text;
                ACarrera = dlCarrera.Text;


                //Proceso de inserción del registro en la tabla Producto de la B.D. Olivos//
                SQLInsert = string.Format("Insert into Alumno(Matricula, Nombre, Apellidos, Telefono, Carrera)" +
                                          "Values('{0}', '{1}', '{2}', '{3}', '{4}')", AMatricula, ANombre, AApellido, ATelefono, ACarrera);

                SQLCmd.CommandText = SQLInsert;
                SQLCmd.ExecuteNonQuery();

                string script = "alert('Alumno Ingresado Correctamente');";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);

                SQLCon.Close();


                tbMatricula.Text = "";
                tbNombre.Text = "";
                tbApellidos.Text = "";
                tbTelefono.Text = "";
            }
        }

        protected void btEliminar_Click(object sender, EventArgs e)
        {
            string MatriculaEli;
            MatriculaEli = tbMatriculaElim.Text;

            EscuelaTableAdapters.AlumnoTableAdapter taAl = new EscuelaTableAdapters.AlumnoTableAdapter();

            taAl.Delete(MatriculaEli);

            Response.Redirect("Alumnos.aspx");
        }
    }
}