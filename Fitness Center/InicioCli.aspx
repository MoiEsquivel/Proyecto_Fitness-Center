<%@ Page Title="" Language="C#" MasterPageFile="~/MenuCliente.Master" AutoEventWireup="true" CodeBehind="InicioCli.aspx.cs" Inherits="Fitness_Center.InicioCli" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <link href="css/Galeria.css" rel="stylesheet" />
        <br />
        <br />
        <br />
        <br />     
        

        <div class="responsive">
          <div class="gallery">
            <a target="_blank" href="images/1.jpg">
              <img src="images/1.jpg" alt="Cinque Terre" width="600" height="400" />
            </a>
            <div class="desc">Para tener éxito, en primer lugar debemos creer que podemos.- Nikos Kazantzakis.</div>
          </div>
        </div>


        <div class="responsive">
          <div class="gallery">
            <a target="_blank" href="images/gym2.jfif">
              <img src="images/gym2.jfif" alt="Forest" width="600" height="400"/>
            </a>
            <div class="desc">La motivación es lo que te pone en marcha, y el hábito es lo que hace que sigas.-.Jim Ryun.</div>
          </div>
        </div>

        <div class="responsive">
          <div class="gallery">
            <a target="_blank" href="images/GYM/gym2.jfif">
              <img src="images/2.jpeg" alt="Northern Lights" width="600" height="400"/>
            </a>
            <div class="desc">Lo que cuenta no es el número de horas que trabajas, sino la energía que pones en esas horas.</div>
          </div>
        </div>

        <div class="responsive">
          <div class="gallery">
              <a href="images/gym3.jfif" target="_blank">
              <img src="images/gym3.jfif" alt="Mountains" width="600" height="400"/></a><a target="_blank" href="images/GYM/gym3.jfif">
              </a>
            <div class="desc">Cada paso que das es un paso alejado de donde solías estar.-Brian Chargualaf.</div>
          </div>
        </div>
</asp:Content>

