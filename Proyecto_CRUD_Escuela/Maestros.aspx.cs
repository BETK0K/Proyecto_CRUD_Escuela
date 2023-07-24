using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_CRUD_Escuela
{
    public partial class Maestros : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btGuardarM_Click(object sender, ImageClickEventArgs e)
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
                string MMatricula, MNombre, MApellido, MTelefono, MCarrera;

                //Asignar los valores a su variable correspondiente//     
                MMatricula = tbMatriculaM.Text;
                MNombre = tbNombreM.Text;
                MApellido = tbApellidosM.Text;
                MTelefono = tbTelefonoM.Text;
                MCarrera = dlCarreraM.Text;


                //Proceso de inserción del registro en la tabla Producto de la B.D. Olivos//
                SQLInsert = string.Format("Insert into Maestros(Matricula_Empleado, Nombre, Apellidos, Telefono, Carrera)" +
                                          "Values('{0}', '{1}', '{2}', '{3}', '{4}')", MMatricula, MNombre, MApellido, MTelefono, MCarrera);

                SQLCmd.CommandText = SQLInsert;
                SQLCmd.ExecuteNonQuery();

                string script = "alert('Maestro Ingresado Correctamente');";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);

                SQLCon.Close();


                tbMatriculaM.Text = "";
                tbNombreM.Text = "";
                tbApellidosM.Text = "";
                tbTelefonoM.Text = "";
            }
        }

        protected void btEliminar_Click(object sender, EventArgs e)
        {
            string MatriculaMEli;
            MatriculaMEli = tbMatriculaMElim.Text;
            EscuelaTableAdapters.MaestrosTableAdapter taMae = new EscuelaTableAdapters.MaestrosTableAdapter();

            taMae.Delete(MatriculaMEli);

            Response.Redirect("Maestros.aspx");
        }
    }
}