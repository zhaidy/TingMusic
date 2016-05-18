<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="TingMusic._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function Download() {
            $('#downloadModal').modal('show');
        }
    </script>
    <div class="page-header">
        <input id="txtSearch" type="text" class="form-control" runat="server" />
    </div>
    <asp:UpdatePanel ID="pnlBody" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <%=name%>
                        <small class="pull-right"><%=update_date%></small>
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <asp:GridView ID="gvSongList" runat="server" CssClass="table table-striped" GridLines="None"
                                DataKeyNames="SongId"
                                AutoGenerateColumns="false" OnRowCommand="gvSongList_RowCommand">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Title" HeaderText="Title" />
                                    <asp:BoundField DataField="ArtistName" HeaderText="ArtistName" />
                                    <asp:BoundField DataField="AlbumTitle" HeaderText="AlbumTitle" DataFormatString="<<{0}>>" />
                                    <asp:TemplateField HeaderText="Download">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnView" runat="server" CssClass="btn btn-xs btn-primary-outline"
                                                CommandName="Download" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"><span class="icon icon-eye"></span> Download</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal" id="downloadModal">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span
                                    aria-hidden="true">&times;</span></button>
                            <asp:Label ID="lblTitle" runat="server" Text="" CssClass="h4 modal-title"></asp:Label>
                        </div>
                        <div class="modal-body">
                            <asp:Repeater runat="server" ID="rLinks">
                                <ItemTemplate>
                                    <a><%# Eval("ShowLink") %></a>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
