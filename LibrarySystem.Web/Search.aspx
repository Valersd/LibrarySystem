<%@ Page Title="Search" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="LibrarySystem.Web.Search" %>

<asp:Content ID="ContentSearch" ContentPlaceHolderID="MainContent" runat="server">
    <h3 id="h3SearchResultsTitle" runat="server"></h3>
    <asp:ListView ID="lvSearchBooks" runat="server" ItemType="LibrarySystem.Data.Book">
        <LayoutTemplate>
            <ul runat="server">
                <li runat="server" id="itemPlaceholder"></li>
            </ul>
        </LayoutTemplate>
        <ItemTemplate>
            <p>
                <b><asp:HyperLink NavigateUrl='<%# String.Format("~/BookDetails.aspx?id={0}",Item.Id) %>' Text="<%# Item.Title %>" runat="server" /></b>
                &nbsp;by&nbsp;
                <em><asp:Label ID="lblAuthor" runat="server" Text='<%# Item.Author %>'></asp:Label></em>
                <asp:Label ID="lblCategory" Text='<%# String.Format(" ({0})", Item.Category.Name) %>' runat="server" />
            </p>
        </ItemTemplate>
        <EmptyDataTemplate>
            <p>
                <asp:Label Text='There are no books for this query' runat="server" ID="lblEmptyData" />
            </p>
        </EmptyDataTemplate>
    </asp:ListView>
    <a href="Default.aspx">Back</a>
</asp:Content>
