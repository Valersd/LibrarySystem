<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Books.aspx.cs" Inherits="LibrarySystem.Web.Admin.Books" %>
<asp:Content ID="ContentBooks" ContentPlaceHolderID="MainContent" runat="server">
    <%--<link href="../Content/bootstrap.css" rel="stylesheet" />--%>
    <h2>Edit Books</h2>
    <div class="row">
        <div class=" col-md-12">
            <asp:EntityDataSource ID="edsEditBooks" runat="server"
                ConnectionString="name=LibraryDbEntities"
                DefaultContainerName="LibraryDbEntities"
                EnableFlattening="False"
                EntitySetName="Books" Include="Category">
            </asp:EntityDataSource>
            <asp:GridView ID="gvEditBooks" runat="server"
                DataSourceID="edsEditBooks"
                AutoGenerateColumns="False"
                ItemType="LibrarySystem.Data.Book"
                CssClass="table table-bordered" AllowPaging="True"
                AllowSorting="True" PagerSettings-Mode="Numeric" PageSize="5" OnRowCommand="gvEditBooks_RowCommand">

                <Columns>
                    <asp:TemplateField HeaderText="Title" SortExpression="Title">
                        <ItemTemplate>
                            <asp:HyperLink NavigateUrl='<%# String.Format("~/BookDetails?id={0}",Item.Id) %>' Text='<%# CutLongString(Item.Title) %>' ToolTip="<%# Item.Title %>"  runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Author" SortExpression="Author">
                        <ItemTemplate>
                            <asp:Label Text='<%# CutLongString(Item.Author) %>' ToolTip="<%# Item.Author %>" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ISBN" SortExpression="ISBN">
                        <ItemTemplate>
                            <asp:Label Text='<%# Item.ISBN %>' ToolTip="<%# Item.ISBN %>" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Web Site" SortExpression="Url">
                        <ItemTemplate>
                            <asp:HyperLink NavigateUrl='<%# "http://" + Item.Url %>' Text='<%# CutLongString(Item.Url) %>' ToolTip="<%# Item.Url %>" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Category Name" SortExpression="Category.Name">
                        <ItemTemplate>
                            <asp:Label Text='<%# CutLongString(Item.Category.Name) %>' ToolTip="<%# Item.Category.Name %>" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="15%" HeaderText="Action" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Justify">
                        <ItemTemplate>
                            <asp:Button ID="btnGoToEditBook" Text="Edit" runat="server" CssClass="btn btn-info" CommandName="Edit" CommandArgument='<%# Item.Id %>' />
                            <%--<asp:Button ID="btnGoToDeleteBook" Text="Delete" runat="server" CssClass="btn btn-danger" ClientIDMode="Static" OnClientClick="getModal()" />--%>
                            <button runat="server" class="btn btn-danger" data-toggle="modal" data-target="#myModal" data-backdrop="static" data-keyboard="false" data-name="<%# Item.Title %>" data-book-id="<%# Item.Id %>">
                                Delete
                            </button>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:HiddenField ID="hfBookId" runat="server" />
            <asp:Button Text="Add new book" CssClass="btn btn-lg btn-success" ID="btnAddBook" OnClick="btnAddBook_Click" runat="server" />
        </div>

        <%--Modal window--%>

        <div class="modal fade" id="myModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <h4 class="modal-title">Delete confirmation</h4>
                        </div>
                        <div class="modal-body">
                            <p>Are you sure to delete <label id="lblName" class="h4"></label> ?</p>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnDeleteBook" CssClass="btn btn-danger" runat="server" OnCommand="btnDeleteBook_Command" CommandName="Del" Text="Delete" />
                            <button type="button" class="btn" data-dismiss="modal">Cancel</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- /.modal -->
    </div>
    <script>
        function getModal() {
            $('#btnGoToDeleteBook').attr('data-toggle', 'modal').attr('data-target', '#myModal');
            return false;
        }

        $('#myModal').modal({
            backdrop: 'static',
            keyboard: false
        })

        $('#myModal').on('show.bs.modal', function (e) {
            var name = $(e.relatedTarget).data('name');
            var bookId = $(e.relatedTarget).data('book-id');
            $('#lblName').text('"' + name + '"');
            $('#MainContent_hfBookId').val(bookId);
        });
        
    </script>
</asp:Content>
