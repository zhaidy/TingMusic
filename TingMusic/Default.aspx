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
            <!-- Main Content -->
            <div class="row">
                <div class="col-md-4">
                </div>
                <div class="col-md-8">
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
            </div>
            <!-- Modal -->
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

    <!-- Audio player -->
    <div class="ap" id="ap">
        <div class="ap-inner">
            <div class="ap-panel">
                <div class="ap-item ap--playback">
                    <button class="ap-controls ap-prev-btn" type="button">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="#ffffff" height="24" viewBox="0 0 24 24"
                            width="24">
                            <path d="M6 6h2v12H6zm3.5 6l8.5 6V6z" />
                            <path d="M0 0h24v24H0z" fill="none" />
                        </svg>
                    </button>
                    <button class="ap-controls ap-toggle-btn" type="button">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="#fff" height="30" viewBox="0 0 24 24"
                            width="30" class="ap--play">
                            <path d="M8 5v14l11-7z" />
                            <path d="M0 0h24v24H0z" fill="none" />
                        </svg>
                        <svg xmlns="http://www.w3.org/2000/svg" fill="#ffffff" height="30" viewBox="0 0 24 24"
                            width="30" class="ap--pause">
                            <path d="M6 19h4V5H6v14zm8-14v14h4V5h-4z" />
                            <path d="M0 0h24v24H0z" fill="none" />
                        </svg>
                    </button>
                    <button class="ap-controls ap-next-btn" type="button">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="#ffffff" height="24" viewBox="0 0 24 24"
                            width="24">
                            <path d="M6 18l8.5-6L6 6v12zM16 6v12h2V6h-2z" />
                            <path d="M0 0h24v24H0z" fill="none" />
                        </svg>
                    </button>
                </div>
                <div class="ap-item ap--track">
                    <div class="ap-info">
                        <div class="ap-title">Unknown</div>
                        <div class="ap-time">
                            <span class="ap-time--current">--</span>
                            <span>/ </span>
                            <span class="ap-time--duration">--</span>
                        </div>

                        <div class="ap-progress-container">
                            <div class="ap-progress">
                                <div class="ap-bar"></div>
                                <div class="ap-preload-bar"></div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="ap-item ap--settings">
                    <div class="ap-controls ap-volume-container">
                        <button class="ap-volume-btn" type="button">
                            <svg fill="#ffffff" height="48" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"
                                class="ap--volume-on">
                                <path d="M3 9v6h4l5 5V4L7 9H3zm13.5 3c0-1.77-1.02-3.29-2.5-4.03v8.05c1.48-.73 2.5-2.25 2.5-4.02zM14 3.23v2.06c2.89.86 5 3.54 5 6.71s-2.11 5.85-5 6.71v2.06c4.01-.91 7-4.49 7-8.77s-2.99-7.86-7-8.77z" />
                                <path d="M0 0h24v24H0z" fill="none" />
                            </svg>
                            <svg xmlns="http://www.w3.org/2000/svg" fill="#ffffff" height="48" viewBox="0 0 24 24"
                                width="24" class="ap--volume-off">
                                <path d="M7 9v6h4l5 5V4l-5 5H7z" />
                                <path d="M0 0h24v24H0z" fill="none" />
                            </svg>
                        </button>
                        <div class="ap-volume">
                            <div class="ap-volume-progress">
                                <div class="ap-volume-bar"></div>
                            </div>
                        </div>
                    </div>
                    <button class="ap-controls ap-repeat-btn" type="button">
                        <svg fill="#ffffff" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
                            <path d="M0 0h24v24H0z" fill="none" />
                            <path d="M7 7h10v3l4-4-4-4v3H5v6h2V7zm10 10H7v-3l-4 4 4 4v-3h12v-6h-2v4z" />
                        </svg>
                    </button>
                    <button class="ap-controls ap-playlist-btn" type="button">
                        <svg fill="#ffffff" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
                            <path d="M0 0h24v24H0z" fill="none" />
                            <path d="M15 6H3v2h12V6zm0 4H3v2h12v-2zM3 16h8v-2H3v2zM17 6v8.18c-.31-.11-.65-.18-1-.18-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3V8h3V6h-5z" />
                        </svg>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <script src="js/player.js"></script>
</asp:Content>
