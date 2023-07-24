<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Materias.aspx.cs" Inherits="Proyecto_CRUD_Escuela.Materias" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" href="Imagenes/Icono.ico" />
    <title>Control Escolar - Materias</title>
    <link rel="stylesheet" type="text/css" href="Estilos/index.css" />
</head>
<body>
    <header>
        <br />
        <center>
            <img width="110" height="110" src="Imagenes/school.png" />
        </center>
        <h1>Materias</h1><br />
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
            <h2 style="text-align:center; font-family:'Century Gothic'">REGISTRO DE MATERIAS</h2>
            <table style="margin-left:26%; text-align:center">
               <tr>
                    <td>
                        <br />
                    </td>            
               </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbNombreMt" runat="server" Text="Nombre:" CssClass="textbox"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox id="tbNombreMt" runat="server" CssClass="textbox1"></asp:TextBox>
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                    <td>
                        <asp:Label ID="lbCarrera" runat="server" Text="Carrera:" CssClass="textbox"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="dlCarreraMt" runat="server" CssClass="textbox" DataSourceId="SqlCarreras" DataTextField="Nombre_Carrera" DataValueField="Nombre_Carrera"></asp:DropDownList>
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                    <td>
                        <asp:ImageButton ID="btCancelarMt" runat="server" ImageUrl="~/Imagenes/cancelar.png" ImageAlign="Right"/>
                    </td>
                    <td>
                        <asp:ImageButton ID="btGuardarMt" runat="server" ImageUrl="~/Imagenes/guardar.png" ImageAlign="Right" OnClick="btGuardarMt_Click" />
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <h2 style="text-align:center; font-family:'Century Gothic'">CONSULTA DE MATERIAS</h2>
            <br /><br />
            <asp:GridView ID="gdMaestros" runat="server" AutoGenerateColumns="False" DataSourceID="SqlMaterias" CssClass="grid" DataKeyNames="Nombre_Materia">
                <Columns>
                    <asp:BoundField DataField="IdMateria" HeaderText="Clave de Materia" InsertVisible="False" ReadOnly="True" SortExpression="IdMateria" />
                    <asp:BoundField DataField="Nombre_Materia" HeaderText="Nombre de la Materia" ReadOnly="True" SortExpression="Nombre_Materia" />
                    <asp:BoundField DataField="Carrera_Impartida" HeaderText="Carrera Donde es Impartida" SortExpression="Carrera_Impartida" />
                </Columns>
            </asp:GridView>
            <br />
            <br />
            <table  style="margin-left:10%; text-align:center">
                <tr>
                    <td>
                        <asp:Label ID="lbMatriculaMa" runat="server" Text="Buscar por Nombre de la Materia:  " CssClass="textbox"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbMatriculaMa" runat="server" CssClass="textbox1" Width="80%"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btBuscarMa" runat="server" Text="Buscar" CssClass="textbox" Width="80px"/>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <asp:GridView ID="gbMatriculaMa" runat="server" DataSourceID="SqlBuscarMateria" CssClass="grid" AutoGenerateColumns="False" DataKeyNames="Nombre_Materia">
                <Columns>
                    <asp:BoundField DataField="IdMateria" HeaderText="Clave de Materia" InsertVisible="False" ReadOnly="True" SortExpression="IdMateria" />
                    <asp:BoundField DataField="Nombre_Materia" HeaderText="Nombre_Materia" ReadOnly="True" SortExpression="Nombre_Materia" />
                    <asp:BoundField DataField="Carrera_Impartida" HeaderText="Carrera_Impartida" SortExpression="Carrera_Impartida" />
                </Columns>
            </asp:GridView>
            <br />
            <br />
            <h2 style="text-align:center; font-family:'Century Gothic'">ELIMINAR MATERIA</h2>
            <br /><br />
            <table  style="margin-left:10%; text-align:center">
                <tr>
                    <td>
                        <asp:Label ID="lbMateriaElim" runat="server" Text="Clave de Materia:  " CssClass="textbox"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbMateriaMElim" runat="server" CssClass="textbox1" Width="80%"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btMateriaEliminar" runat="server" Text="Eliminar" CssClass="textbox" Width="80px" OnClick="btMateriaEliminar_Click"/>
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

    <asp:SqlDataSource ID="SqlMaterias" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EscuelaConnectionString %>"
        SelectCommand="SELECT * FROM [Materias]">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlBuscarMateria" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EscuelaConnectionString %>"
        SelectCommand="SELECT * FROM Materias where Nombre_Materia=@Nombre_Materia">
        <SelectParameters>
            <asp:ControlParameter ControlID="tbMatriculaMa" Name="Nombre_Materia" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</body>
</html>
