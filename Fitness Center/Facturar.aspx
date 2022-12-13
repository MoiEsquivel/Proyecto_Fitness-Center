<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Facturar.aspx.cs" Inherits="Fitness_Center.Facturar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 200px;
        }
        .auto-style4 {
            width: 685px;
        }
        .auto-style5 {
            width: 250px;
        }
        .auto-style6 {
            height: 32%;
        }
        .auto-style7 {
            width: 32%;
        }
        .auto-style9 {
            width: 32%;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                        <asp:TextBox ID="tcodigocliente" runat="server"  TextMode="Number" OnTextChanged="tcodigocliente_TextChanged"></asp:TextBox>
                        </td>
                    <td >
                        <asp:TextBox ID="tnombrecliente" runat="server" Enabled="False" Width="95%"></asp:TextBox></td>
                    <td >
                        <asp:TextBox ID="tfecha" runat="server" TextMode="Number"></asp:TextBox></td>
                    <td >
                        <asp:TextBox ID="tnumerofactura" runat="server" Enabled="False"></asp:TextBox></td>
                   </tr>
        <tr>
                    <td ><strong>Codigo Producto</strong></td>
                    <td ><strong>Producto</strong></td>
                    <td ><strong>Cantidad</strong></td>
                    <td ><strong>Precio</strong></td>
                </tr>

                <tr>
                    <td >
                        <asp:TextBox ID="tcodigo" runat="server" TextMode="Number" OnTextChanged="tcodigo_TextChanged"></asp:TextBox>&nbsp;&nbsp;
                        </td>
                    <td >
                        <asp:TextBox ID="tnombre" runat="server" Width="95%" Enabled="False"></asp:TextBox></td>
                    <td >
                        <asp:TextBox ID="tcantidad" runat="server" TextMode="Number"></asp:TextBox></td>
                    <td >
                        <asp:TextBox ID="tprecio" runat="server" Enabled="False"></asp:TextBox></td>
                                    
    </table>
        </div >
                        <asp:Button ID="Bingresar" runat="server" Text="Ingresar" OnClick="Bingresar_Click" />               
     <div> 
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" GridLines="None"
                AllowPaging="true" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                PageSize="5" >
                <Columns>
                    <asp:BoundField DataField="Codigo" HeaderText="Codigo" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
                    <asp:BoundField DataField="Precio" HeaderText="Precio" />
                    <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" />
                </Columns>
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
     <asp:Button ID="Bfactura" runat="server" Text="Facturar" OnClick="Bfactura_Click" />

</asp:Content>
