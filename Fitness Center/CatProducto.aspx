<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="CatProducto.aspx.cs" Inherits="Fitness_Center.CatProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="css/Formu.css" rel="stylesheet" />
    <link href="css/grid.css" rel="stylesheet" />

    <div class="Contenedor" style="float:right; display:inline-block">
        <asp:GridView ID="datagrid1" runat="server" CssClass="mydatagrid" PagerStyle-CssClass="pager"
                HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True">
            </asp:GridView>
    </div>

    <div class="Contenedor">
        <asp:Label ID="Lbuscarx" runat="server" Text="Buscar por: Nombre" ></asp:Label>                
        <asp:TextBox ID="Tbuscar" runat="server"></asp:TextBox>
        <asp:Button ID="Bbuscar" runat="server" Text="Buscar" OnClick="Bbuscar_Click" />
    </div>    

    <div class="Contenedor" style="float:left; display:inline-block">
        <div>
            <label style="float:left; font-size:18px"> Codigo Producto: </label>
            <asp:Label ID="Lcodigo" runat="server" Text="" style="float:left; font-size:17px"></asp:Label>  <br />           
            </div>    
        <br />
        <asp:Label ID="Label1" runat="server" Text="Nombre del Producto:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TnombreP" runat="server" Width="60%"></asp:TextBox> <br />
        <asp:Label ID="Label2" runat="server" Text="Precio del Producto:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TprecioP"  runat="server" Width="60%"></asp:TextBox>

    </div>
    <div class="Contenedor1">
        <asp:Button ID="Bagregar" runat="server" Text="Agregar" OnClick="Bagregar_Click" />
        <asp:Button ID="Bmodificar" runat="server" Text="Modificar" OnClick="Bmodificar_Click" />
        <asp:Button ID="Beliminar" runat="server" Text="Eliminar" OnClick="Beliminar_Click" />
    </div>

    
</asp:Content>
