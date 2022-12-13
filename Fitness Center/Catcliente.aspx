<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Catcliente.aspx.cs" Inherits="Fitness_Center.Catcliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="css/Formulario.css" rel="stylesheet" />
    <link href="css/grid.css" rel="stylesheet" />

    <div class="Contenedor">
        <asp:Label ID="Lbuscarx" runat="server" Text="Buscar por:"></asp:Label>
        <asp:DropDownList ID="Dbuscar" runat="server" CssClass="entrada">
            <asp:ListItem>Nombre y Apellido</asp:ListItem>
            <asp:ListItem>Correo</asp:ListItem>
            <asp:ListItem>Todos</asp:ListItem>
        </asp:DropDownList>        
        <asp:TextBox ID="Tbuscar" runat="server"></asp:TextBox>
        <asp:Button ID="Bbuscar" runat="server" Text="Buscar" OnClick="Bbuscar_Click1" />
    </div>

    <div class="Contenedor">
            <div>
            <asp:Label ID="Lcodigo" runat="server" Text="" style="float:right; font-size:12px"></asp:Label>
             <label style="float:right; font-size:12px"> Codigo Cliente: </label>
            </div>    
        <br />
        <div>  
            <asp:Label ID="Label1" runat="server" Text="Nombre:  "></asp:Label>
            <asp:TextBox ID="Tnombre" runat="server" placeholder="Escribe el nombre..."></asp:TextBox>
        </div>

        <div>
            <asp:Label ID="Label2" runat="server" Text="Apellido:  "></asp:Label>
            <asp:TextBox ID="Tapellido" runat="server" placeholder="Escribe el apellido..."></asp:TextBox>
        </div>

        <div>
            <asp:Label ID="Label3" runat="server" Text="Correo:"></asp:Label>
             <asp:TextBox ID="Tcorreo" runat="server" placeholder="Escribe el correo"></asp:TextBox>
        </div>

        <div>
            <asp:Label ID="Label4" runat="server" Text="Telefono:  "></asp:Label>
             <asp:TextBox ID="Telefono" runat="server" placeholder="Numero de telefono..."></asp:TextBox>
        </div>

        <div >
             <asp:DropDownList ID="Dprov" runat="server" CssClass="entrada" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="NombreProv" DataValueField="CodProvincia"></asp:DropDownList> 
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GimnasioConnectionString %>" SelectCommand="SELECT * FROM [Provincia]"></asp:SqlDataSource>
            <br /> <asp:DropDownList ID="Dcanton" runat="server" CssClass="entrada" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Nombrecant" DataValueField="CodCanton"></asp:DropDownList>
             <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GimnasioConnectionString %>" SelectCommand="Selectcanton" SelectCommandType="StoredProcedure">
                 <SelectParameters>
                     <asp:ControlParameter ControlID="Dprov" Name="Codigo" PropertyName="SelectedValue" Type="Int32" />
                 </SelectParameters>
             </asp:SqlDataSource>
             <br /><asp:DropDownList ID="Ddistrito" runat="server" CssClass="entrada" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="NombreDistrito" DataValueField="CodDistrito"></asp:DropDownList>
             <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:GimnasioConnectionString %>" SelectCommand="Selectdidtrito" SelectCommandType="StoredProcedure">
                 <SelectParameters>
                     <asp:ControlParameter ControlID="Dcanton" Name="Codigo" PropertyName="SelectedValue" Type="Int32" />
                 </SelectParameters>
             </asp:SqlDataSource>
        </div>
        <div class="dirci">
            <asp:TextBox ID="Tseñas" runat="server" placeholder="Otras señas..." ></asp:TextBox>
        </div>
        <div>            
            <asp:DropDownList ID="Dtipo" runat="server" CssClass="entrada" >
                <asp:ListItem>Tipo de Usuario</asp:ListItem>
                <asp:ListItem>Admi</asp:ListItem>
                <asp:ListItem Selected="True">Cliente</asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>
    <div>
        <asp:GridView ID="datagrid" runat="server" CssClass="mydatagrid" PagerStyle-CssClass="pager"
                HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True">
            </asp:GridView> 
    </div>

    <div class="Contenedor1">
        <div class="Baction">
            <asp:Button ID="Bagregar" runat="server" Text="AGREGAR" OnClick="Bagregar_Click" /></div>
        <div class="Baction">
            <asp:Button ID="Bborrar" runat="server" Text="BORRAR" OnClick="Bborrar_Click" /></div>
        <div class="Baction">
            <asp:Button ID="Bmodifi" runat="server" Text="MODIFICAR" OnClick="Bmodifi_Click" /></div>
       <div class="Baction">
            <asp:Button ID="Blimbiar" runat="server" Text="LIMPIAR" OnClick="Blimbiar_Click" /></div>        
        
    </div>

</asp:Content>
