<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Alumnos.aspx.cs" Inherits="Proyecto_CRUD_Escuela.Alumnos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" href="Imagenes/Icono.ico" />
    <title>Control Escolar - Alumnos</title>
    <link rel="stylesheet" type="text/css" href="Estilos/index.css" />
</head>
<body>
    <header>
        <br />
        <center>
            <img width="110" height="110" src="Imagenes/school.png" />
        </center>
        <h1>Alumnos</h1><br />
    </header>
    <nav class="menu">
        <ul>
            <li><a href="index.html">Inicio</a></li>
            <li><a href="Carreras.aspx">Carreras</a></li>
            <li><a href="Alumnos.aspx">Alumnos</a></li>
            <li><a href="Maestros.aspx">Maestros</a></li>
            <li><a href="Materias.aspx">Materias</a></li>
        </ul>
    </nav>
    <section>
        <form id="form1" runat="server">
            <br />
            <h2 style="text-align:center; font-family:'Century Gothic'">REGISTRO DE ALUMNOS</h2>
            <table style="margin-left:18%; text-align:center">
               <tr>
                    <td>
                        <br />
                    </td>            
               </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbMatricula" runat="server" Text="Matricula:" CssClass="textbox"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox id="tbMatricula" runat="server" CssClass="textbox1"></asp:TextBox>
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                    <td>
                        <asp:Label ID="lbNombre" runat="server" Text="Nombre:" CssClass="textbox"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox id="tbNombre" runat="server" CssClass="textbox1"></asp:TextBox>
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                    <td>
                        <asp:Label ID="lbApellidos" runat="server" Text="Apellido:" CssClass="textbox"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox id="tbApellidos" runat="server" CssClass="textbox1"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbTelefono" runat="server" Text="Telefono:" CssClass="textbox"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbTelefono" runat="server" CssClass="textbox1"></asp:TextBox>
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                    <td>
                        <asp:Label ID="lbCarrera" runat="server" Text="Carrera:" CssClass="textbox"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="dlCarrera" runat="server" CssClass="textbox" DataSourceId="SqlCarreras" DataTextField="Nombre_Carrera" DataValueField="Nombre_Carrera"></asp:DropDownList>
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                    <td>
                        <asp:ImageButton ID="btCancelar" runat="server" ImageUrl="~/Imagenes/cancelar.png" ImageAlign="Right"/>
                    </td>
                    <td>
                        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Imagenes/guardar.png" ImageAlign="Right" OnClick="btGuardar_Click" />
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <h2 style="text-align:center; font-family:'Century Gothic'">CONSULTA DE ALUMNOS</h2>
            <br /><br />
            <asp:GridView ID="gdAlumnos" runat="server" AutoGenerateColumns="false" DataKeyNames="Nombre" DataSourceID="SqlAlumnos" CssClass="grid">
                <Columns>
                    <asp:BoundField DataField="Matricula" HeaderText="Matricula" SortExpression="Matricula" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" InsertVisible="false" ReadOnly="true" SortExpression="Nombre" />
                    <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" SortExpression="Apellidos" />
                    <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
                    <asp:BoundField DataField="Carrera" HeaderText="Carrera" SortExpression="Carrera" />
                </Columns>
            </asp:GridView>
            <br />
            <br />
            <table  style="margin-left:10%; text-align:center">
                <tr>
                    <td>
                        <asp:Label ID="lbMatriculaAl" runat="server" Text="Buscar por Matricula de Alumno:  " CssClass="textbox"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbMatriculaAl" runat="server" CssClass="textbox1" Width="80%"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btBuscar" runat="server" Text="Buscar" CssClass="textbox" Width="80px"/>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <asp:GridView ID="gbMatriculaAl" runat="server" DataSourceID="SqlBuscarAlumno" CssClass="grid" AutoGenerateColumns="False" DataKeyNames="Nombre">
                <Columns>
                    <asp:BoundField DataField="Matricula" HeaderText="Matricula" SortExpression="Matricula" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" ReadOnly="true" SortExpression="Nombre" />
                    <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" SortExpression="Apellidos" />
                    <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
                    <asp:BoundField DataField="Carrera" HeaderText="Carrera" SortExpression="Carrera" />
                </Columns>
            </asp:GridView>
            <br />
            <br />
            <h2 style="text-align:center; font-family:'Century Gothic'">BAJA DE ALUMNOS</h2>
            <br /><br />
            <table  style="margin-left:10%; text-align:center">
                <tr>
                    <td>
                        <asp:Label ID="lbMatriculaElim" runat="server" Text="Matricula de Alumno a Dar de Baja:  " CssClass="textbox"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbMatriculaElim" runat="server" CssClass="textbox1" Width="80%"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btEliminar" runat="server" Text="Eliminar" CssClass="textbox" Width="80px" OnClick="btEliminar_Click"/>
                    </td>
                </tr>
            </table>
            <br />
            <br />
        </form>
    </section>
    <asp:SqlDataSource ID="SqlCarreras" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EscuelaConnectionString %>"
        SelectCommand="SELECT [Nombre_Carrera] FROM [Carreras]">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlAlumnos" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EscuelaConnectionString %>"
        SelectCommand="SELECT * FROM Alumno">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlBuscarAlumno" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EscuelaConnectionString %>"
        SelectCommand="SELECT * FROM Alumno where Matricula=@Matricula">
        <SelectParameters>
            <asp:ControlParameter ControlID="tbMatriculaAl" Name="Matricula" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</body>
</html>