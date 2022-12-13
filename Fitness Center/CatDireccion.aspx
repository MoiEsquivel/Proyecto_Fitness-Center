<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="CatDireccion.aspx.cs" Inherits="Fitness_Center.CatDireccion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin: 8px 15px;
            padding: 6px 15px;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="css/Formulario.css" rel="stylesheet" />

    <div class="Contenedor" style="text-align:left; width:32.5%; display:inline-block">
        <asp:Label ID="Label2" runat="server" Text="Provincias"></asp:Label>
        <asp:DropDownList ID="DProvinciaD" runat="server" CssClass="auto-style1" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="NombreProv" DataValueField="CodProvincia" Width="150px"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GimnasioConnectionString %>" SelectCommand="SELECT * FROM [Provincia]"></asp:SqlDataSource>
        <br /><asp:Label ID="Label1" runat="server" Text="Agregar nueva Provincia:  "></asp:Label>
        <asp:TextBox ID="TnewProv" runat="server" Width="60%"></asp:TextBox>
        <asp:Button ID="BagreP" runat="server" Text="Agregar Provincia" OnClick="BagreP_Click" Width="47.5%" />
        <asp:Button ID="BborrarP" runat="server" Text="Eliminar Provincia" Width="47.5%" OnClick="BborrarP_Click" />
        <asp:Label ID="Label8" runat="server" Text="Para agregar Provincias debe Esvcribir el Nombre de la Provincia que desea agregar"></asp:Label>
    </div>
    
     <div class="Contenedor" style="text-align:left; width:32.5%; display:inline-block">
        <asp:Label ID="Label3" runat="server" Text="Cantones:"></asp:Label>
        <asp:DropDownList ID="DcantonD" runat="server" CssClass="auto-style1" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Nombrecant" DataValueField="CodCanton" Width="150px"></asp:DropDownList>
         <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GimnasioConnectionString %>" SelectCommand="Selectcanton" SelectCommandType="StoredProcedure">
             <SelectParameters>
                 <asp:ControlParameter ControlID="DProvinciaD" Name="Codigo" PropertyName="SelectedValue" Type="Int32" />
             </SelectParameters>
         </asp:SqlDataSource><br />
        <asp:Label ID="Label4" runat="server" Text="Agregar nuevo Canton:"></asp:Label>
        <asp:TextBox ID="TnewCanton1" runat="server" Width="60%"></asp:TextBox><br />
        <asp:Button ID="BagreC" runat="server" Text="Agregar Canton" Width="47.5%" OnClick="BagreC_Click" />
         <asp:Button ID="BborrarC" runat="server" Text="Eliminar Canton" Width="47.5%" OnClick="BborrarC_Click" />
         <asp:Label ID="Label7" runat="server" Text="Para agregar cantones debe seleccionar la porvincia a la que corresponde"></asp:Label>
    </div>
    
     <div class="Contenedor" style="text-align:left; width:32.5%; display:inline-block">
        <asp:Label ID="Label5" runat="server" Text="Distritos: "></asp:Label>
        <asp:DropDownList ID="DdistrD" runat="server"  CssClass="auto-style1" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="NombreDistrito" DataValueField="CodDistrito" Width="150px"></asp:DropDownList>
         <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:GimnasioConnectionString %>" SelectCommand="Selectdidtrito" SelectCommandType="StoredProcedure">
             <SelectParameters>
                 <asp:ControlParameter ControlID="DcantonD" Name="Codigo" PropertyName="SelectedValue" Type="Int32" />
             </SelectParameters>
         </asp:SqlDataSource> <br />
        <asp:Label ID="Label6" runat="server" Text="Agregar nuevo Distrito:"></asp:Label>
        <asp:TextBox ID="TnewDistrito" runat="server" Width="60%"></asp:TextBox><br />
        <asp:Button ID="BagreD" runat="server" Text="Agregar Distrito" Width="47.5%" OnClick="BagreD_Click"  />
         <asp:Button ID="BborrarD" runat="server" Text="Eliminar Distrito" Width="47.5%" OnClick="BborrarD_Click" />
         <asp:Label ID="Label9" runat="server" Text="Para agregar distritos debe seleccionar el canton al que corresponde"></asp:Label>
    </div>
</asp:Content>
