<%@ Page Title="Manage Book" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddEditBook.aspx.cs" Inherits="LibrarySystem.Web.Admin.EditBook" %>

<asp:Content ID="ContentAddEditBook" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <h2 id="h2Title" runat="server">Edit Book</h2>
    <div class="row">
        <div class="col-md-8">
            <div class="form-horizontal">
                <div class="form-group">
                    <asp:Label ID="lblTitle" AssociatedControlID="txtTitle" CssClass="col-md-2 control-label" runat="server">Title:</asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtTitle" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblAuthor" AssociatedControlID="txtAuthor" CssClass="col-md-2 control-label" runat="server">Author:</asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtAuthor" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblIsbn" AssociatedControlID="txtIsbn" CssClass="col-md-2 control-label" runat="server">ISBN:</asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtIsbn" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblUrl" AssociatedControlID="txtUrl" CssClass="col-md-2 control-label" runat="server">Web Site:</asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtUrl" CssClass="form-control" runat="server" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblDescription" AssociatedControlID="txtDescription" CssClass="col-md-2 control-label" runat="server">Description:</asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtDescription" CssClass="form-control" runat="server" TextMode="MultiLine" Rows="7" />
                    </div>
                </div>
                <asp:EntityDataSource ID="edsCategories"
                    runat="server"
                    ConnectionString="name=LibraryDbEntities"
                    DefaultContainerName="LibraryDbEntities"
                    EnableFlattening="False"
                    EntitySetName="Categories"
                    OrderBy="it.Name">
                </asp:EntityDataSource>
                <div class="form-group">
                    <asp:Label ID="lblCategory" AssociatedControlID="ddlCategories" CssClass="col-md-2 control-label" runat="server">Category:</asp:Label>
                    <div class="col-md-5">
                        <asp:DropDownList CssClass="form-control" ID="ddlCategories" runat="server" DataSourceID="edsCategories" DataTextField="Name" DataValueField="Id">
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-success" Text="Add" OnClick="btnAdd_Click" />
            <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-success" Text="Update" OnClick="btnUpdate_Click" />
            <asp:Button ID="btnCancel" runat="server" CssClass="btn" Text="Cancel" CausesValidation="false" OnClick="btnCancel_Click" />
            <br />
            <br />
            <a href="javascript:history.go(-1)">Back</a>
        </div>
    </div>
</asp:Content>
