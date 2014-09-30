<%@ Page Title="BookDetails" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookDetails.aspx.cs" Inherits="LibrarySystem.Web.BookDetails" %>

<asp:Content ID="ContentBookDetails" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <h2>Book Details</h2>
    <asp:EntityDataSource ID="edsBookDetails" runat="server"
        ConnectionString="name=LibraryDbEntities"
        DefaultContainerName="LibraryDbEntities"
        EnableFlattening="False"
        EntitySetName="Books" Where="it.Id=@id">
        <WhereParameters>
            <asp:QueryStringParameter Name="Id" QueryStringField="id" DbType="Int32" />
        </WhereParameters>

    </asp:EntityDataSource>
    <asp:DetailsView runat="server" ID="dvBookDetails"
        ItemType="LibrarySystem.Data.Book"
        AutoGenerateRows="False"
        DefaultMode="ReadOnly"
        DataSourceID="edsBookDetails" BorderStyle="None" GridLines="None" Width="50%">
        <Fields>
            <asp:TemplateField>
                <ItemTemplate>
                    <div class="well well-sm">
                        <asp:Label Text="<%# Item.Title %>" runat="server" CssClass="h3" />
                    </div>
                    by&nbsp;<em><b><asp:Label Text='<%# Item.Author %>' runat="server" CssClass="h4" /></b></em>
                    <br />
                    <br />
                    <div class="panel">
                        <em>
                            <asp:Label Text='<%# "ISBN: " + Item.ISBN %>' Visible="<%# Item.ISBN != null %>" runat="server" />
                        </em>
                    </div>
                    <asp:Panel runat="server" Visible="<%# Item.Url != null %>" CssClass="panel">
                        <asp:Label Text='Web Site: ' runat="server" />
                        <asp:HyperLink NavigateUrl='<%# "http://" + Item.Url %>' Text='<%# Item.Url %>' runat="server" />
                    </asp:Panel>
                    <div class="panel">
                        <asp:Label Text="<%# Item.Description %>" Visible="<%# Item.Description != null %>" runat="server" />
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
        <EmptyDataTemplate>
            <p>There is no record for this book</p>
        </EmptyDataTemplate>
    </asp:DetailsView>
    <br />
    <a href="javascript:history.go(-1)">Back</a>
</asp:Content>
