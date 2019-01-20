<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChu.master" AutoEventWireup="true" CodeFile="dtdd.aspx.cs" Inherits="dtdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    <title id="lbTitle" runat="server"></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="gioithieu" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="noidung" runat="Server">
    <!-- Go to www.addthis.com/dashboard to customize your tools -->
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5bf912ba239e0e49"></script>

    <table style="background: #FFF; margin-bottom: 10px;" class="col-sm-12">
        <tr>
            <td style="padding: 10px">
                <asp:Label ID="lbBanner" runat="server"></asp:Label>
            </td>
            <td style="vertical-align: top; padding: 0 10px 10px 10px">
                <asp:DataList ID="dlSanPham" runat="server" OnItemDataBound="dlSanPham_ItemDataBound" RepeatLayout="Flow">
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="lbTenSP" runat="server" CssClass="h11" Text='<%# Eval("TenSP") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server" CssClass="price1" Text='<%# Eval("GiaBan","{0:#,#₫}") %>'></asp:Label>
                                    <asp:Label ID="lbGiamGia" runat="server" Text='<%# "Giảm " + Eval("GiamGia","{0:#,#}") + "₫" %>' CssClass="giamgia1"></asp:Label>
                                    <asp:Label ID="lbTraGop" runat="server" Text='<%# Eval("TraGop") %>' CssClass="tragop1"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <ul class="giaohang24h">
                                        <li style="padding: 1px 7px 3px 6px; border-right: 1px #c4ddc8 solid">
                                            <img src="images/icon/24h.png"></li>
                                        <li style="margin: 4.5px 7px 0">NHẬN HÀNG TRONG VÒNG 24H</li>
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <ul class="chinhsach">
                                        <li>
                                            <img src="images/icon/certificate.png">
                                            Hàng chính hãng</li>
                                        <li>
                                            <img src="images/icon/shield.png">
                                            Bảo hành 12 tháng chính hãng</li>
                                        <li>
                                            <img src="images/icon/1.png">
                                            1 đổi 1 trong 1 tháng nếu lỗi, đổi sản phẩm tại nhà trong vòng 1 ngày</li>
                                    </ul>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
                <div class="khuyenmai">
                    <div>
                        <i class="fas fa-gift"></i><label style="padding:0 5px; font-weight:bold">KHUYẾN MÃI</label><i class="fas fa-gift"></i>
                    </div>
                    <asp:DataList ID="dlKhuyenMai" runat="server" CssClass="km">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/images/icon/check1.png" CssClass="hinhkm" />
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Noidung") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="buy1" ForeColor="White">
                    <p>MUA NGAY</p>
                    <p style="font-size: 13px">Giao tận nơi hoặc nhận tại cửa hàng</p>
                </asp:HyperLink>
            </td>
        </tr>
    </table>
    <table style="background: #FFF" class="col-12">
        <tr>
            <td style="padding: 10px; width: 71%; vertical-align: top">
                <h1 class="h11">Đánh giá</h1>
                <asp:DataList ID="dlDanhGia" runat="server">
                    <ItemTemplate>
                        <div class="danhgia">
                            <asp:Label ID="Label32" runat="server" Text='<%# Eval("DanhGia") %>'></asp:Label>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                <br />
                <hr />
                <!--binh luan start-->
                <div style="margin-bottom: 10px; margin-top: 10px" runat="server" id="dBinhluan">
                    <asp:TextBox ID="taBinhLuan" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" placeholder="Mời bạn để lại bình luận..."></asp:TextBox>
                    <asp:Button ID="btnGui" runat="server" Text="Gửi" CssClass="send" OnClick="btnGui_Click" />
                </div>
                <div runat="server" id="dthongbao" style="margin-top: 10px; margin-bottom: 10px">
                    <asp:Label ID="Label33" runat="server" Text="Tính năng bình luận tạm thời bị vô hiệu hóa. Để sử dụng tính năng này vui lòng đăng nhập tại"></asp:Label>
                    <asp:HyperLink ID="HyperLink2" runat="server" ForeColor="Blue" NavigateUrl="~/DangNhap.aspx"> đây</asp:HyperLink>
                </div>
                <div style="margin-bottom:10px;padding-left:5px">
                    <asp:Label ID="lbSLBinhLuan" runat="server" Font-Bold="True" Font-Size="18px"></asp:Label>
                </div>
                <hr />
                <div style="margin-top:10px">
                <asp:DataList ID="dlBinhLuan" runat="server" OnItemDataBound="dlBinhLuan_ItemDataBound" OnItemCommand="dlBinhLuan_ItemCommand" DataKeyField="ID" OnDeleteCommand="dlBinhLuan_DeleteCommand">
                    <ItemTemplate>
                        <asp:Label ID="lbHinh" runat="server" CssClass="lbHinh" Width="25px" Height="25px"></asp:Label>
                        <asp:Label ID="lbTenKH" runat="server" Text='<%# Eval("HoTen") %>' ForeColor="#ff9c00" Font-Bold="True"></asp:Label>
                        <br />
                        <asp:Label ID="lbNoiDung" runat="server" Text='<%# Eval("BinhLuan") %>'></asp:Label>
                        <br />
                        <asp:Label ID="lbThich" runat="server" Text="Thích" ForeColor="#333333"></asp:Label>
                        <asp:LinkButton ID="lThich" runat="server" ForeColor="#333333" Text="Thích" CommandName="Thich"></asp:LinkButton>
                        <asp:Label ID="lbSLThich" runat="server" Text='<%# Eval("Thich") %>' Font-Size="12px"></asp:Label>
                        <asp:Label ID="lbThoiGian" runat="server" Text='<%# Eval("ThoiGian","{0:• dd-MM-yyyy • H:mm}") %>' ForeColor="#333333" Font-Size="13px"></asp:Label>
                        <asp:Label ID="lbDot" runat="server" Text=" • " ForeColor="#333333" Font-Size="13px"></asp:Label>
                        <asp:LinkButton ID="lXoa" runat="server" CommandName="delete" Text="Xóa" ForeColor="Red"></asp:LinkButton>
                        <asp:Label ID="Label35" runat="server" Text='<%# Eval("Thich") %>' Font-Size="12px"></asp:Label>
                        <br />
                        <br />
                    </ItemTemplate>
                </asp:DataList>
                    </div>
                <!--binh luan end-->
            </td>
            <td style="vertical-align: top; padding: 10px">
                <asp:DataList ID="dlThongSo" runat="server">
                    <ItemTemplate>
                        <h1 style="text-align: center; margin-bottom: 10px" class="h11">Thông số kỹ thuật</h1>
                        <ul class="thongsokythuat-chitiet">
                            <li style="color: red; background: rgba(235,235,235,1)">Màn hình</li>
                            <li><span>Công nghệ màn hình</span><div>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("CNManHinh") %>'></asp:Label>
                            </div>
                            </li>
                            <li><span>Độ phân giải</span><div>
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("DoPhanGiaiMH") %>'></asp:Label>
                            </div>
                            </li>
                            <li><span>Màn hình rộng</span><div>
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("MHRong") %>'></asp:Label>
                            </div>
                            </li>
                            <li><span>Mặt kính cảm ứng</span><div>
                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("CamUng") %>'></asp:Label>
                            </div>
                            </li>

                            <li style="color: red; background: rgba(235,235,235,1)">Camera sau</li>
                            <li><span>Độ phân giải</span><div>
                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("DoPhanGiaiCamSau") %>'></asp:Label>
                            </div>
                            </li>
                            <li><span>Quay phim</span><div>
                                <asp:Label ID="Label8" runat="server" Text='<%# Eval("QuayPhimSau") %>'></asp:Label>
                            </div>
                            </li>
                            <li><span>Đèn Flash</span><div>
                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("DenFlash") %>'></asp:Label>
                            </div>
                            </li>
                            <li><span>Chụp ảnh nâng cao</span><div>
                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("ChupAnhNangCao") %>'></asp:Label>
                            </div>
                            </li>

                            <li style="color: red; background: rgba(235,235,235,1)">Camera trước</li>
                            <li><span>Độ phân giải</span><div>
                                <asp:Label ID="Label11" runat="server" Text='<%# Eval("DoPhanGiaiCamTruoc") %>'></asp:Label>
                            </div>
                            </li>
                            <li><span>Videocall</span><div>
                                <asp:Label ID="Label12" runat="server" Text='<%# Eval("VideoCall") %>'></asp:Label>
                            </div>
                            </li>
                            <li><span>Thông tin khác</span><div>
                                <asp:Label ID="Label13" runat="server" Text='<%# Eval("ThongTinKhac") %>'></asp:Label>
                            </div>
                            </li>

                            <li style="color: red; background: rgba(235,235,235,1)">Hệ điều hành - CPU</li>
                            <li><span>Hệ điều hành</span><div>
                                <asp:Label ID="Label14" runat="server" Text='<%# Eval("HDH") %>'></asp:Label>
                            </div>
                            </li>
                            <li><span>Chipset</span><div>
                                <asp:Label ID="Label15" runat="server" Text='<%# Eval("ChipSet") %>'></asp:Label>
                            </div>
                            </li>
                            <li><span>Tốc độ CPU</span><div>
                                <asp:Label ID="Label16" runat="server" Text='<%# Eval("TocDoCPU") %>'></asp:Label>
                            </div>
                            </li>
                            <li><span>Chip đồ họa (GPU)</span><div>
                                <asp:Label ID="Label17" runat="server" Text='<%# Eval("GPU") %>'></asp:Label>
                            </div>
                            </li>

                            <li style="color: red; background: rgba(235,235,235,1)">Bộ nhớ & Lưu trữ</li>
                            <li><span>RAM</span><div>
                                <asp:Label ID="Label18" runat="server" Text='<%# Eval("Ram") %>'></asp:Label>
                            </div>
                            </li>
                            <li><span>Bộ nhớ trong</span><div>
                                <asp:Label ID="Label19" runat="server" Text='<%# Eval("BoNhoTrong") %>'></asp:Label>
                            </div>
                            </li>
                            <li><span>Thẻ nhớ ngoài</span><div>
                                <asp:Label ID="Label20" runat="server" Text='<%# Eval("TheNho") %>'></asp:Label>
                            </div>
                            </li>

                            <li style="color: red; background: rgba(235,235,235,1)">Kết nối</li>
                            <li><span>SIM</span><div>
                                <asp:Label ID="Label21" runat="server" Text='<%# Eval("Sim") %>'></asp:Label>
                            </div>
                            </li>
                            <li><span>Cổng kết nối/sạc</span><div>
                                <asp:Label ID="Label22" runat="server" Text='<%# Eval("Sac") %>'></asp:Label>
                            </div>
                            </li>
                            <li><span>Jack tai nghe</span><div>
                                <asp:Label ID="Label23" runat="server" Text='<%# Eval("TaiNghe") %>'></asp:Label>
                            </div>
                            </li>

                            <li style="color: red; background: rgba(235,235,235,1)">Thiết kế & Trọng lượng</li>
                            <li><span>Thiết kế</span><div>
                                <asp:Label ID="Label24" runat="server" Text='<%# Eval("ThietKe") %>'></asp:Label>
                            </div>
                            </li>
                            <li><span>Chất liệu</span><div>
                                <asp:Label ID="Label25" runat="server" Text='<%# Eval("ChatLieu") %>'></asp:Label>
                            </div>
                            </li>
                            <li><span>Kích thước</span><div>
                                <asp:Label ID="Label26" runat="server" Text='<%# Eval("KichThuoc") %>'></asp:Label>
                            </div>
                            </li>
                            <li><span>Trọng lượng</span><div>
                                <asp:Label ID="Label27" runat="server" Text='<%# Eval("TrongLuong") %>'></asp:Label>
                            </div>
                            </li>

                            <li style="color: red; background: rgba(235,235,235,1)">Thông tin pin & Sạc</li>
                            <li><span>Dung lượng pin</span><div>
                                <asp:Label ID="Label28" runat="server" Text='<%# Eval("Pin") %>'></asp:Label>
                            </div>
                            </li>
                            <li><span>Loại pin</span><div>
                                <asp:Label ID="Label29" runat="server" Text='<%# Eval("LoaiPin") %>'></asp:Label>
                            </div>
                            </li>
                            <li><span>Công nghệ pin</span><div>
                                <asp:Label ID="Label30" runat="server" Text='<%# Eval("CongNghePin") %>'></asp:Label>
                            </div>
                            </li>

                            <li style="color: red; background: rgba(235,235,235,1)">Thông tin khác</li>
                            <li><span>Thời điểm ra mắt</span><div>
                                <asp:Label ID="Label31" runat="server" Text='<%# Eval("ThoiDiemRaMat") %>'></asp:Label>
                            </div>
                            </li>
                        </ul>
                    </ItemTemplate>
                </asp:DataList>
            </td>
        </tr>
    </table>
</asp:Content>
