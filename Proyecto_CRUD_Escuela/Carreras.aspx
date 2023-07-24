<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Carreras.aspx.cs" Inherits="Proyecto_CRUD_Escuela.Carreras" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" href="Imagenes/Icono.ico" />
    <title>Control Escolar - Carreras</title>
    <link rel="stylesheet" type="text/css" href="Estilos/index.css" />
</head>
<body>
    <header>
        <br />
        <center>
            <img width="110" height="110" src="Imagenes/school.png" />
        </center>
        <h1>Carreras</h1><br />
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
        <form id="form2" runat="server">
            <br />
            <h2 style="text-align:center; font-family:'Century Gothic'">REGISTRO DE CARRERAS</h2>
            <table style="margin-left:16%; text-align:center">
               <tr>
                    <td>
                        <br />
                    </td>            
               </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbNombreC" runat="server" Text="Nombre de la Carrera:" CssClass="textbox"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox id="tbNombreC" runat="server" CssClass="textbox1"></asp:TextBox>
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                    <td>
                        <asp:Label ID="lbNombreTSU" runat="server" Text="Nombre de TSU:" CssClass="textbox"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox id="tbNombreTSU" runat="server" CssClass="textbox1"></asp:TextBox>
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                    <td>
                        <asp:Label ID="lbCuatri" runat="server" Text="N° de Cuatrimestres:" CssClass="textbox"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox id="tbCuatri" runat="server" CssClass="textbox1"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbTelefonoC" runat="server" Text="Telefono:" CssClass="textbox"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbTelefonoC" runat="server" CssClass="textbox1"></asp:TextBox>
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                    <td>
                        <asp:ImageButton ID="btCancelarM" runat="server" ImageUrl="~/Imagenes/cancelar.png" ImageAlign="Right"/>
                    </td>
                    <td>
                        <asp:ImageButton ID="btGuardarM" runat="server" ImageUrl="~/Imagenes/guardar.png" ImageAlign="Right" OnClick="btGuardarMt_Click" />
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <h2 style="text-align:center; font-family:'Century Gothic'">CONSULTA DE CARRERAS</h2>
            <br /><br />
            <asp:GridView ID="gdCarreras" runat="server" AutoGenerateColumns="False" DataSourceID="SqlCarreras" CssClass="grid" DataKeyNames="Nombre_Carrera">
                <Columns>
                    <asp:BoundField DataField="IdCarrera" HeaderText="Clave de la Carrera" InsertVisible="False" ReadOnly="True" SortExpression="IdCarrera" />
                    <asp:BoundField DataField="Nombre_Carrera" HeaderText="ING / LIC" ReadOnly="True" SortExpression="Nombre_Carrera" />
                    <asp:BoundField DataField="Nombre_TSU" HeaderText="TSU" SortExpression="Nombre_TSU" />
                    <asp:BoundField DataField="Cuatrimestres" HeaderText="Cuatrimestres" SortExpression="Cuatrimestres" />
                    <asp:BoundField DataField="Telefono_Carrera" HeaderText="Telefono_Carrera" SortExpression="Telefono_Carrera" />
                </Columns>
            </asp:GridView>
            <br />
            <br />
            <table  style="margin-left:10%; text-align:center">
                <tr>
                    <td>
                        <asp:Label ID="lbCarrera" runat="server" Text="Buscar por Nombre de la Carrera:  " CssClass="textbox"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbCarrera" runat="server" CssClass="textbox1" Width="80%"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btBuscar" runat="server" Text="Buscar" CssClass="textbox" Width="80px"/>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <asp:GridView ID="gbCarrera" runat="server" DataSourceID="SqlBuscarCarrera" CssClass="grid" AutoGenerateColumns="False" DataKeyNames="Nombre_Carrera">
                <Columns>
                    <asp:BoundField DataField="IdCarrera" HeaderText="Clave de la Carrera" InsertVisible="False" ReadOnly="True" SortExpression="IdCarrera" />
                    <asp:BoundField DataField="Nombre_Carrera" HeaderText="ING / LIC" ReadOnly="True" SortExpression="Nombre_Carrera" />
                    <asp:BoundField DataField="Nombre_TSU" HeaderText="TSU" SortExpression="Nombre_TSU" />
                    <asp:BoundField DataField="Cuatrimestres" HeaderText="Cuatrimestres" SortExpression="Cuatrimestres" />
                    <asp:BoundField DataField="Telefono_Carrera" HeaderText="Telefono_Carrera" SortExpression="Telefono_Carrera" />
                </Columns>
            </asp:GridView>
            <br />
            <br />
            <h2 style="text-align:center; font-family:'Century Gothic'">ELIMINAR CARRERAS</h2>
            <br /><br />
            <table  style="margin-left:10%; text-align:center">
                <tr>
                    <td>
                        <asp:Label ID="lbCarreraElim" runat="server" Text="Nombre de la Carrera:  " CssClass="textbox"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbCarreraElim" runat="server" CssClass="textbox1" Width="80%"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btEliminarC" runat="server" Text="Eliminar" CssClass="textbox" Width="80px"/>
                    </td>
                </tr>
            </table>
            <br />
            <br />
        </form>
    </section>
    <asp:SqlDataSource ID="SqlCarreras" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EscuelaConnectionString %>"
        SelectCommand="SELECT * FROM [Carreras]">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlBuscarCarrera" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EscuelaConnectionString %>"
        SelectCommand="SELECT * FROM Carreras where Nombre_Carrera=@Nombre_Carrera">
        <SelectParameters>
            <asp:ControlParameter ControlID="tbCarrera" Name="Nombre_Carrera" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</body>
</html>
