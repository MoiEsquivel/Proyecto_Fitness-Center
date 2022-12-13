<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="CatFacturas.aspx.cs" Inherits="Fitness_Center.CatFacturas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <link href="css/Formulario.css" rel="stylesheet" />

    <div class="Contenedor">
        <asp:Label ID="Lbuscarx" runat="server" Text="Buscar por:"></asp:Label>
        <asp:DropDownList ID="Dbuscar" runat="server" CssClass="entrada">
            <asp:ListItem>Numero de Factura</asp:ListItem>
        </asp:DropDownList>        
        <asp:TextBox ID="Tbuscar" runat="server"></asp:TextBox>
        <asp:Button ID="Bbuscar" runat="server" Text="Buscar" OnClick="Bbuscar_Click" />
    </div>
    <link href="css/Table.css" rel="stylesheet" />

    <div style="margin-top:10px;">
    <table>
          <tr>
             <td class="auto-style1"><strong>Codigo cliente</strong></td>
             <td class="auto-style4" ><strong>Nombre Cliente</strong></td>
             <td class="auto-style5" ><strong>Fecha</strong></td>
             <td ><strong>Numero factura</strong></td>
         </tr>
         <tr>
              <td >
                   <asp:TextBox ID="tcodigocliente" runat="server"  TextMode="Number" Enabled="False"></asp:TextBox>
                        </td>
             <td >
                  <asp:TextBox ID="tnombrecliente" runat="server" Enabled="False" Width="95%"></asp:TextBox></td>
              <td >
                  <asp:TextBox ID="tfecha" runat="server" TextMode="Number" Enabled="False"></asp:TextBox></td>
              <td >
                  <asp:TextBox ID="tnumerofactura" runat="server" Enabled="False"></asp:TextBox></td>
          </tr>
       
                                    
    </table>
        </div >
                                    
     <div> 
            <asp:GridView ID="GridView1" runat="server" GridLines="None"
                AllowPaging="true" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                PageSize="5" >               
            </asp:GridView>
        </div>
    <div>
            <table style="border: 1px solid #000000;">
                <tr>
                    <td class="auto-style7" ><strong>SUBTOTAL</strong></td>
                    <td class="auto-style9" ><strong>IVA</strong></td>
                    <td class="auto-style6" ><strong>TOTAL</strong></td>
                </tr>
                <tr>
                    <td class="auto-style7" >
                        <asp:Label ID="LSB" runat="server" Font-Size="Large" Text="0"></asp:Label>
                    </td>
                    <td >
                        <asp:Label ID="LIVA" runat="server" Font-Size="Large" Text="0"></asp:Label>
                    </td>
                    <td >
                        <asp:Label ID="LTOTAL" runat="server" Font-Size="Large" Text="0"></asp:Label>
                    </td>
                    
                </tr>
                
            </table>
        </div>
    <div>
        <asp:Button ID="BnuevaB" runat="server" Text="Nueva Busqueda" OnClick="BnuevaB_Click" />
    </div>
</asp:Content>
