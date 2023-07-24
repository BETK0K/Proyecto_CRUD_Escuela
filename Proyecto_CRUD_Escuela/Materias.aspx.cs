using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_CRUD_Escuela
{
    public partial class Materias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btGuardarMt_Click(object sender, ImageClickEventArgs e)
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
                string MatNombre, MatCarrera;

                //Asignar los valores a su variable correspondiente//
                MatNombre = tbNombreMt.Text;
                MatCarrera = dlCarreraMt.Text;


                //Proceso de inserción del registro en la tabla Producto de la B.D. Olivos//
                SQLInsert = string.Format("Insert into Materias(Nombre_Materia, Carrera_Impartida)" +
                                          "Values('{0}', '{1}')", MatNombre, MatCarrera);

                SQLCmd.CommandText = SQLInsert;
                SQLCmd.ExecuteNonQuery();

                string script = "alert('Materia Ingresada Correctamente');";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);

                SQLCon.Close();

                tbNombreMt.Text = "";
                
            }
        }

        protected void btMateriaEliminar_Click(object sender, EventArgs e)
        {
         
        }
    }
}