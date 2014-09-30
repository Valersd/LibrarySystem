<%@ Page Title="categories" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="LibrarySystem.Web.Admin.Categories" %>

<asp:Content ID="ContentCategories" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <h2>Edit Categories</h2>
    <div class="row">
        <div class=" col-md-6">
            <asp:EntityDataSource ID="edsEditCategories" runat="server"
                ConnectionString="name=LibraryDbEntities"
                DefaultContainerName="LibraryDbEntities"
                EnableFlattening="False"
                EnableDelete="true"
                EntitySetName="Categories">
            </asp:EntityDataSource>
            <asp:GridView ID="gvEditcategories" runat="server"
                DataSourceID="edsEditCategories"
                AutoGenerateColumns="False"
                ItemType="LibrarySystem.Data.Category"
                CssClass="table table-bordered" AllowPaging="True"
                AllowSorting="True" PagerSettings-Mode="Numeric" PageSize="5" OnRowCommand="gvEditcategories_RowCommand">

                <Columns>
                    <asp:TemplateField HeaderText="Category Name" SortExpression="Name">
                        <ItemTemplate>
                            <asp:Label Text='<%# Item.Name %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="30%" HeaderText="Action" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Justify">
                        <ItemTemplate>
                            <asp:Button ID="btnEditcategory" Text="Edit" runat="server" CssClass="btn btn-info" CausesValidation="false" CommandName="Edit" CommandArgument='<%# Item.Id + ";" + Item.Name %>' />
                            <asp:Button ID="btnDeleteCategory" Text="Delete" runat="server" CssClass="btn btn-danger" CommandName="Del" CommandArgument='<%# Item.Id + ";" + Item.Name %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:Button Text="Create new category" CssClass="btn btn-lg btn-success" ID="btnCreateCategory" OnClick="btnCreateCategory_Click" runat="server" />
        </div>
        <div class="col-md-6">
            <asp:MultiView Visible="false" ActiveViewIndex="0" runat="server" ID="mvEditCreateCategories">
                <asp:View runat="server" ID="viewCreateCategory">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <h4>Create new category</h4>
                        </div>
                        <div class="form-horizontal row panel-body">
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtCategoryName" CssClass="col-md-3 control-label">Category Name:</asp:Label>
                                <div class="col-md-9">
                                    <asp:TextBox runat="server" ID="txtCategoryName" CssClass="form-control" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCategoryName"
                                        CssClass="text-danger" ErrorMessage="The category name field is required." Display="Dynamic" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <asp:Button Text="Save" ID="btnSaveCategory" runat="server" CssClass="btn btn-success" OnClick="btnSaveCategory_Click" />
                    <asp:Button Text="Cancel" ID="btnCancel" runat="server" CssClass="btn" CausesValidation="false" OnClick="btnCancel_Click" />
                </asp:View>
                <asp:View runat="server" ID="viewEditCategory">
                    <asp:HiddenField ID="hfCategoryId" runat="server" />
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <h4>Edit category</h4>
                        </div>
                        <div class="form-horizontal row panel-body">
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtEditCategoryName" CssClass="col-md-3 control-label">Category Name:</asp:Label>
                                <div class="col-md-9">
                                    <asp:TextBox runat="server" ID="txtEditCategoryName" CssClass="form-control" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEditCategoryName"
                                        CssClass="text-danger" ErrorMessage="The category name field is required." Display="Dynamic" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <asp:Button Text="Update" ID="btnUpdate" runat="server" CssClass="btn btn-success" OnClick="btnUpdate_Click" />
                    <asp:Button Text="Cancel" ID="btnCancelUpdate" runat="server" CssClass="btn" CausesValidation="false" OnClick="btnCancel_Click" />
                </asp:View>
                <asp:View ID="viewDeleteCategory" runat="server">
                    <asp:HiddenField ID="hfCategoryIdDel" runat="server" />
                    <p class="alert alert-info h4">
                        Are you sure to delete category <asp:Label ID="lblCategoryNameDel" Text="" runat="server" /> with all its books ?
                    </p>
                    <asp:Button Text="Delete" ID="btnDelete" runat="server" CssClass="btn btn-danger" OnClick="btnDelete_Click" />
                    <asp:Button Text="Cancel" ID="btnCancelDelete" runat="server" CssClass="btn" CausesValidation="false" OnClick="btnCancel_Click" />
                </asp:View>
            </asp:MultiView>
        </div>
    </div>
    <script src="../Scripts/Script.js"></script>
</asp:Content>
