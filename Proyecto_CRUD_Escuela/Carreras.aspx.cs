using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_CRUD_Escuela
{
    public partial class Carreras : System.Web.UI.Page
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
                string CNombre, CTSU, CTelefono;
                int CCuatri;

                //Asignar los valores a su variable correspondiente//
                CNombre = tbNombreC.Text;
                CTSU = tbNombreTSU.Text;
                CCuatri = int.Parse(tbCuatri.Text);
                CTelefono = tbTelefonoC.Text;

                //Proceso de inserción del registro en la tabla Producto de la B.D. Olivos//
                SQLInsert = string.Format("Insert into Carreras(Nombre_Carrera, Nombre_TSU, Cuatrimestres, Telefono)" +
                                          "Values('{0}', '{1}', '{2}', {3})", CNombre, CTSU, CCuatri, CTelefono);

                SQLCmd.CommandText = SQLInsert;
                SQLCmd.ExecuteNonQuery();

                string script = "alert('Carrera Ingresada Correctamente');";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);

                SQLCon.Close();

                tbNombreC.Text = "";
                tbNombreTSU.Text = "";
                tbCuatri.Text = "";
                tbTelefonoC.Text = "";


            }
        }
    }
}
