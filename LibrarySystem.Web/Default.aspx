<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LibrarySystem.Web._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <h1>Books</h1>
    <div class="form-group" style="margin-top:-50px; padding-bottom:30px">
        <asp:Button Text="Search" ID="btnSearch" CssClass=" btn btn-info pull-right" runat="server" OnClick="btnSearch_Click"/>
        <asp:TextBox runat="server"  ID="txtSearch" Width="30%" CssClass="form-control pull-right"/>
    </div>
    <div class="row">
        <asp:EntityDataSource runat="server" ID="edsCategories"
            ConnectionString="name=LibraryDbEntities"
            DefaultContainerName="LibraryDbEntities"
            EnableFlattening="False"
            EntitySetName="Categories"
            Include="Books">
        </asp:EntityDataSource>
        <asp:ListView ID="lvCategoriesBooks" runat="server"
            DataSourceID="edsCategories"
            ItemType="LibrarySystem.Data.Category"
            DataKeyNames="Id" GroupItemCount="3">
            <LayoutTemplate>
                <table id="mainTable" runat="server" class="table">
                    <tr id="groupPlaceholder" runat="server">
                    </tr>
                </table>
            </LayoutTemplate>
            <GroupTemplate>
                <tr id="tableRow" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <ItemTemplate>
                <td style="vertical-align:top">
                    <h3>
                        <asp:Label ID="lblCategoryName" runat="server" Text="<%# Item.Name %>" /></h3>
                    <asp:ListView ID="lvBooks" runat="server" DataSource="<%# Item.Books %>" ItemType="LibrarySystem.Data.Book">
                        <LayoutTemplate>
                            <ul runat="server">
                                <li id="itemPlaceholder" runat="server"></li>
                            </ul>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <p>
                                <b><asp:HyperLink NavigateUrl='<%# String.Format("~/BookDetails.aspx?id={0}",Item.Id) %>' Text="<%# Item.Title %>" runat="server" /></b>
                                &nbsp;by&nbsp;<em><asp:Label runat="server" Text='<%# String.Format("{0}",Item.Author) %>'></asp:Label></em>
                            </p>
                        </ItemTemplate>
                        <EmptyItemTemplate>
                            <p>There are no books for this category</p>
                        </EmptyItemTemplate>
                    </asp:ListView>
                </td>
            </ItemTemplate>
        </asp:ListView>
    </div>

</asp:Content>
