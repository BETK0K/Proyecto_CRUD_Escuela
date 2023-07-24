<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Maestros.aspx.cs" Inherits="Proyecto_CRUD_Escuela.Maestros" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" href="Imagenes/Icono.ico" />
    <title>Control Escolar - Maestros</title>
    <link rel="stylesheet" type="text/css" href="Estilos/index.css" />
</head>
<body>
    <header>
        <br />
        <center>
            <img width="110" height="110" src="Imagenes/school.png" />
        </center>
        <h1>Maestros</h1><br />
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
            <h2 style="text-align:center; font-family:'Century Gothic'">REGISTRO DE MAESTROS</h2>
            <table style="margin-left:16%; text-align:center">
               <tr>
                    <td>
                        <br />
                    </td>            
               </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbMatriculaM" runat="server" Text="Matricula Empleado:" CssClass="textbox"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox id="tbMatriculaM" runat="server" CssClass="textbox1"></asp:TextBox>
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                    <td>
                        <asp:Label ID="lbNombreM" runat="server" Text="Nombre:" CssClass="textbox"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox id="tbNombreM" runat="server" CssClass="textbox1"></asp:TextBox>
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                    <td>
                        <asp:Label ID="lbApellidosM" runat="server" Text="Apellido:" CssClass="textbox"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox id="tbApellidosM" runat="server" CssClass="textbox1"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbTelefonoM" runat="server" Text="Telefono:" CssClass="textbox"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbTelefonoM" runat="server" CssClass="textbox1"></asp:TextBox>
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                    <td>
                        <asp:Label ID="lbCarreraM" runat="server" Text="Carrera:" CssClass="textbox"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="dlCarreraM" runat="server" CssClass="textbox" DataSourceId="SqlCarreras" DataTextField="Nombre_Carrera" DataValueField="Nombre_Carrera"></asp:DropDownList>
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                    <td>
                        <asp:ImageButton ID="btCancelarM" runat="server" ImageUrl="~/Imagenes/cancelar.png" ImageAlign="Right"/>
                    </td>
                    <td>
                        <asp:ImageButton ID="btGuardarM" runat="server" ImageUrl="~/Imagenes/guardar.png" ImageAlign="Right" OnClick="btGuardarM_Click" />
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <h2 style="text-align:center; font-family:'Century Gothic'">CONSULTA DE MAESTROS</h2>
            <br /><br />
            <asp:GridView ID="gdMaestros" runat="server" AutoGenerateColumns="False" DataSourceID="SqlMaestros" CssClass="grid" DataKeyNames="Matricula_Empleado">
                <Columns>
                    <asp:BoundField DataField="Matricula_Empleado" HeaderText="Matricula de Empleado" ReadOnly="True" SortExpression="Matricula_Empleado" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
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
                        <asp:Label ID="lbMatriculaMa" runat="server" Text="Buscar por Matricula de Maestro:  " CssClass="textbox"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbMatriculaMa" runat="server" CssClass="textbox1" Width="80%"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btBuscar" runat="server" Text="Buscar" CssClass="textbox" Width="80px"/>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <asp:GridView ID="gbMatriculaMa" runat="server" DataSourceID="SqlBuscarMaestro" CssClass="grid" AutoGenerateColumns="False" DataKeyNames="Nombre">
                <Columns>
                    <asp:BoundField DataField="Matricula_Empleado" HeaderText="Matricula" SortExpression="Matricula_Empleado" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" ReadOnly="true" SortExpression="Nombre" />
                    <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" SortExpression="Apellidos" />
                    <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
                    <asp:BoundField DataField="Carrera" HeaderText="Carrera" SortExpression="Carrera" />
                </Columns>
            </asp:GridView>
            <br />
            <br />
            <h2 style="text-align:center; font-family:'Century Gothic'">BAJA DE MAESTROS</h2>
            <br /><br />
            <table  style="margin-left:10%; text-align:center">
                <tr>
                    <td>
                        <asp:Label ID="lbMatriculaElim" runat="server" Text="Matricula de Alumno a Dar de Baja:  " CssClass="textbox"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbMatriculaMElim" runat="server" CssClass="textbox1" Width="80%"></asp:TextBox>
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

    <asp:SqlDataSource ID="SqlMaestros" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EscuelaConnectionString %>"
        SelectCommand="SELECT * FROM [Maestros]">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlBuscarMaestro" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EscuelaConnectionString %>"
        SelectCommand="SELECT * FROM Maestros where Matricula_Empleado=@Matricula_Empleado">
        <SelectParameters>
            <asp:ControlParameter ControlID="tbMatriculaMa" Name="Matricula_Empleado" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</body>
</html>
