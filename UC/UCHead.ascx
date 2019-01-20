<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UCHead.ascx.cs" Inherits="UC_UCHead" %>

<nav class="navbar navbar-expand-xl navbar-dark fixed-top" style="background: #192433; padding-top: 0; padding-bottom: 0">
    <a class="navbar-brand col-2" href="~/index.aspx" runat="server">
        <img src="images/icon/LOGO.png" height="40px">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse col-10" id="collapsibleNavbar" style="margin-left: 20px">
        <ul class="navbar-nav">
            <li class="nav-item" style="margin-right: 30px">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/HangSanXuat.aspx?MaCty=1" CssClass="nav-link"><i class="fab fa-apple" style="font-size: 33px"></i></asp:HyperLink>
            </li>
            <li class="nav-item" style="margin-right: 30px">
                <a class="nav-link" href="~/HangSanXuat.aspx?MaCty=2" style="font-family: sony; font-size: 24px" runat="server">SONY</a>
            </li>
            <li class="nav-item" style="margin-right: 30px">
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/HangSanXuat.aspx?MaCty=3" CssClass="nav-link"><i class="fab fa-blackberry" style="font-size: 33px"></i></asp:HyperLink>
            </li>
            <li class="nav-item" style="margin-right: 30px">
                <a class="nav-link" href="~/HangSanXuat.aspx?MaCty=4" style="font-family: nokia; font-size: 18.5px; margin-top: 4px" runat="server">NOKIA</a>
            </li>
            <li class="nav-item" style="margin-right: 30px">
                <a class="nav-link" href="~/tintuc.aspx" runat="server"><i class="far fa-newspaper" style="font-size: 33px"></i></a>
            </li>
            <asp:TextBox ID="txtTimKiem" runat="server" CssClass="search" placeholder="Tìm kiếm sản phẩm..."></asp:TextBox>
            <asp:ImageButton ID="btnSearch" runat="server" ImageUrl="~/images/icon/search.png" Width="20px" Height="20px" CssClass="btnSearch" OnClick="btnSearch_Click" />
            <li class="nav-item col-3" style="margin-top: 7px;text-align:center">
                <a class="nav-link" href="../DangNhap.aspx" style="font-family: 'Roboto', sans-serif; font-size: 14px; font-weight: bold" runat="server" id="DangNhap">ĐĂNG NHẬP | ĐĂNG KÝ</a>
                <asp:Label ID="lbTenDN" runat="server" ForeColor="White" CssClass="link" Font-Bold="True"></asp:Label>
                <asp:LinkButton ID="DangXuat" runat="server" CssClass="link" OnClick="DangXuat_Click" Font-Bold="True">ĐĂNG XUẤT</asp:LinkButton>
            </li>
            <li class="nav-item col-1" style="padding:0; padding-left:7px">
                <asp:HyperLink ID="hpGiohang" runat="server" NavigateUrl="~/Giohang.aspx" CssClass="hpgiohang" Text="0" Width="52px" Height="52px"></asp:HyperLink>
            </li>
        </ul>
    </div>
</nav>
