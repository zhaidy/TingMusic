<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Test.aspx.cs" Inherits="TingMusic.Test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
    </script>

    <div class="page-header">
        265051234
    </div>
    <asp:Repeater runat="server" ID="rLinks">
        <ItemTemplate>
            <a href="<%# Eval("FileLink") %>"><%# Eval("FileLink") %></a>
        </ItemTemplate>
    </asp:Repeater>
    <audio controls="controls">
        <source src="Sound/265051234.mp3" type="audio/mp3" />
    </audio>

    <!-- Audio player -->
</asp:Content>
