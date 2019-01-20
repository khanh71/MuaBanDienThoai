<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="ViewDT.aspx.cs" Inherits="Admin_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title id="lbTitle" runat="server"></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="container">
        <asp:Label ID="TenDT" runat="server" Font-Size="35px"></asp:Label>
        <!-- Nav pills -->
        <ul class="nav nav-pills" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" data-toggle="pill" href="#home">TỔNG QUÁT</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="pill" href="#menu1">THÔNG SỐ KỸ THUẬT</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="pill" href="#menu2">HÌNH ẢNH</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="pill" href="#menu3">ĐÁNH GIÁ</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="pill" href="#menu4">KHUYẾN MÃI</a>
            </li>
            <li class="nav-item" style="margin-left:10px">
                <asp:HyperLink runat="server" ImageUrl="~/hinhadmin/edit.png" ID="linkedit" OnLoad="linkedit_Load"></asp:HyperLink>
            </li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
            <div id="home" class="container tab-pane active">
                <br>
                <asp:DataList ID="dlTongQuat" runat="server" OnItemDataBound="dlTongQuat_ItemDataBound">
                    <ItemTemplate>
                        <ul>
                            <li style="display: inline-block; vertical-align: top; margin:0 10px">
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# "images/home/"+ Eval("HinhAnh") %>' />
                            </li>
                            <li style="display: inline-block; margin:0 10px">
                                <ul style="font-size: 20px; list-style-image: url(hinhadmin/check.png)">
                                    <li>
                                        <label style="font-weight: bold">Tên Sản Phẩm: </label>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("TenSP") %>'></asp:Label>
                                    </li>
                                    <li>
                                        <label style="font-weight: bold">Hãng Sản Xuất: </label>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("TenCTy") %>'></asp:Label>
                                    </li>
                                    <li>
                                        <label style="font-weight: bold">Giá Bán: </label>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("GiaBan","{0:#,#₫}") %>'></asp:Label>
                                    </li>
                                    <li>
                                        <label style="font-weight: bold">Trả Góp 0%: </label>
                                        <asp:Label ID="lbTraGop" runat="server" Text='<%# Eval("TraGop") %>'></asp:Label>
                                    </li>
                                    <li>
                                        <label style="font-weight: bold">Giảm Giá: </label>
                                        <asp:Label ID="lbGiamGia" runat="server" Text='<%# Eval("GiamGia","{0:#,#₫}") %>'></asp:Label>
                                    </li>
                                    <li>
                                        <label style="font-weight: bold">Số Lượng Tồn: </label>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("SoLuongTon") %>'></asp:Label>
                                    </li>
                                    <li>
                                        <label style="font-weight: bold">Số Lượng Bán: </label>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("SoLuongBan") %>'></asp:Label>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </ItemTemplate>
                </asp:DataList>
            </div>
            <div id="menu1" class="container tab-pane fade">
                <br>
                <asp:DataList ID="dlThongSo" runat="server">
                    <ItemTemplate>
                        <ul class="dlthongso">
                            <li style="display: inline-block; margin: 0 10px; width: 60%">
                                <ul style="font-size: 19px; list-style-image: url(hinhadmin/check.png)">
                                    <li style="color: red; list-style: none; font-weight: bold">Màn hình</li>
                                    <li>
                                        <label style="font-weight: bold">Công nghệ màn hình: </label>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("CNManHinh") %>'></asp:Label>
                                    </li>
                                    <li>
                                        <label style="font-weight: bold">Độ phân giải: </label>
                                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("DoPhanGiaiMH") %>'></asp:Label>
                                    </li>
                                    <li>
                                        <label style="font-weight: bold">Màn hình rộng: </label>
                                        <asp:Label ID="Label10" runat="server" Text='<%# Eval("MHRong") %>'></asp:Label>
                                    </li>
                                    <li>
                                        <label style="font-weight: bold">Mặt kính cảm ứng: </label>
                                        <asp:Label ID="Label11" runat="server" Text='<%# Eval("CamUng") %>'></asp:Label>
                                    </li>

                                    <li style="color: red; font-weight: bold; list-style: none">Camera sau</li>
                                    <li>
                                        <label style="font-weight: bold">Độ phân giải: </label>
                                        <asp:Label ID="Label12" runat="server" Text='<%# Eval("DoPhanGiaiCamSau") %>'></asp:Label>
                                    </li>
                                    <li>
                                        <label style="font-weight: bold">Quay phim: </label>
                                        <asp:Label ID="Label13" runat="server" Text='<%# Eval("QuayPhimSau") %>'></asp:Label>
                                    </li>
                                    <li>
                                        <label style="font-weight: bold">Đèn Flash: </label>
                                        <asp:Label ID="Label14" runat="server" Text='<%# Eval("DenFlash") %>'></asp:Label>
                                    </li>
                                    <li>
                                        <label style="font-weight: bold">Chụp ảnh nâng cao: </label>
                                        <asp:Label ID="Label15" runat="server" Text='<%# Eval("ChupAnhNangCao") %>'></asp:Label>
                                    </li>

                                    <li style="color: red; font-weight: bold; list-style: none">Camera trước</li>
                                    <li>
                                        <label style="font-weight: bold">Độ phân giải: </label>
                                        <asp:Label ID="Label16" runat="server" Text='<%# Eval("DoPhanGiaiCamTruoc") %>'></asp:Label>
                                    </li>
                                    <li>
                                        <label style="font-weight: bold">Videocall: </label>
                                        <asp:Label ID="Label17" runat="server" Text='<%# Eval("VideoCall") %>'></asp:Label>
                                    </li>
                                    <li>
                                        <label style="font-weight: bold">Thông tin khác: </label>
                                        <asp:Label ID="Label18" runat="server" Text='<%# Eval("ThongTinKhac") %>'></asp:Label>
                                    </li>

                                    <li style="color: red; font-weight: bold; list-style: none">Hệ điều hành - CPU</li>
                                    <li>
                                        <label style="font-weight: bold">Hệ điều hành: </label>
                                        <asp:Label ID="Label19" runat="server" Text='<%# Eval("HDH") %>'></asp:Label>
                                    </li>
                                    <li>
                                        <label style="font-weight: bold">Chipset: </label>
                                        <asp:Label ID="Label20" runat="server" Text='<%# Eval("ChipSet") %>'></asp:Label>
                                    </li>
                                    <li>
                                        <label style="font-weight: bold">Tốc độ CPU: </label>
                                        <asp:Label ID="Label21" runat="server" Text='<%# Eval("TocDoCPU") %>'></asp:Label>
                                    </li>
                                    <li>
                                        <label style="font-weight: bold">Chip đồ họa (GPU): </label>
                                        <asp:Label ID="Label22" runat="server" Text='<%# Eval("GPU") %>'></asp:Label>
                                    </li>

                                    <li style="color: red; font-weight: bold; list-style: none">Bộ nhớ & Lưu trữ</li>
                                    <li>
                                        <label style="font-weight: bold">RAM: </label>
                                        <asp:Label ID="Label23" runat="server" Text='<%# Eval("Ram") %>'></asp:Label>
                                    </li>
                                    <li>
                                        <label style="font-weight: bold">Bộ nhớ trong: </label>
                                        <asp:Label ID="Label24" runat="server" Text='<%# Eval("BoNhoTrong") %>'></asp:Label>
                                    </li>
                                    <li>
                                        <label style="font-weight: bold">Thẻ nhớ ngoài: </label>
                                        <asp:Label ID="Label25" runat="server" Text='<%# Eval("TheNho") %>'></asp:Label>
                                    </li>

                                    <li style="color: red; font-weight: bold; list-style: none">Kết nối</li>
                                    <li>
                                        <label style="font-weight: bold">SIM: </label>
                                        <asp:Label ID="Label26" runat="server" Text='<%# Eval("Sim") %>'></asp:Label>
                                    </li>
                                    <li>
                                        <label style="font-weight: bold">Cổng kết nối/sạc: </label>
                                        <asp:Label ID="Label27" runat="server" Text='<%# Eval("Sac") %>'></asp:Label>
                                    </li>
                                    <li>
                                        <label style="font-weight: bold">Jack tai nghe: </label>
                                        <asp:Label ID="Label28" runat="server" Text='<%# Eval("TaiNghe") %>'></asp:Label>
                                    </li>

                                    <li style="color: red; font-weight: bold; list-style: none">Thiết kế & Trọng lượng</li>
                                    <li>
                                        <label style="font-weight: bold">Thiết kế: </label>
                                        <asp:Label ID="Label29" runat="server" Text='<%# Eval("ThietKe") %>'></asp:Label>
                                    </li>
                                    <li>
                                        <label style="font-weight: bold">Chất liệu: </label>
                                        <asp:Label ID="Label30" runat="server" Text='<%# Eval("ChatLieu") %>'></asp:Label>
                                    </li>
                                    <li>
                                        <label style="font-weight: bold">Kích thước: </label>
                                        <asp:Label ID="Label31" runat="server" Text='<%# Eval("KichThuoc") %>'></asp:Label>
                                    </li>
                                    <li>
                                        <label style="font-weight: bold">Trọng lượng: </label>
                                        <asp:Label ID="Label32" runat="server" Text='<%# Eval("TrongLuong") %>'></asp:Label>
                                    </li>

                                    <li style="color: red; font-weight: bold; list-style: none">Thông tin pin & Sạc</li>
                                    <li>
                                        <label style="font-weight: bold">Dung lượng pin: </label>
                                        <asp:Label ID="Label33" runat="server" Text='<%# Eval("Pin") %>'></asp:Label>
                                    </li>
                                    <li>
                                        <label style="font-weight: bold">Loại pin: </label>
                                        <asp:Label ID="Label34" runat="server" Text='<%# Eval("LoaiPin") %>'></asp:Label>
                                    </li>
                                    <li>
                                        <label style="font-weight: bold">Công nghệ pin: </label>
                                        <asp:Label ID="Label35" runat="server" Text='<%# Eval("CongNghePin") %>'></asp:Label>
                                    </li>

                                    <li style="color: red; font-weight: bold; list-style: none">Thông tin khác</li>
                                    <li>
                                        <label style="font-weight: bold">Thời điểm ra mắt: </label>
                                        <asp:Label ID="Label36" runat="server" Text='<%# Eval("ThoiDiemRaMat") %>'></asp:Label>
                                    </li>
                                </ul>
                            </li>
                            <li style="display: inline-block; vertical-align: top; margin: 0 10px; width: 35%">
                                <ul style="font-size: 19px; list-style-image: url(hinhadmin/check.png)">
                                    <li>
                                        <label style="font-weight: bold">Màn Hình: </label>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("ManHinh") %>'></asp:Label>
                                    </li>
                                    <li>
                                        <label style="font-weight: bold">CPU: </label>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("CPU") %>'></asp:Label>
                                    </li>
                                    <li>
                                        <label style="font-weight: bold">RAM: </label>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("RAM1") %>'></asp:Label>
                                    </li>
                                    <li>
                                        <label style="font-weight: bold">ROM: </label>
                                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("ROM") %>'></asp:Label>
                                    </li>
                                    <li>
                                        <label style="font-weight: bold">Hệ Điều Hành: </label>
                                        <asp:Label ID="lbTraGop" runat="server" Text='<%# Eval("HDH1") %>'></asp:Label>
                                    </li>
                                    <li>
                                        <label style="font-weight: bold">Camera: </label>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Camera") %>'></asp:Label>
                                    </li>
                                    <li>
                                        <label style="font-weight: bold">Selfie: </label>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Selfie") %>'></asp:Label>
                                    </li>
                                    <li>
                                        <label style="font-weight: bold">Pin: </label>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Pin1") %>'></asp:Label>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </ItemTemplate>
                </asp:DataList>
            </div>
            <div id="menu2" class="container tab-pane fade">
                <br>
                <ul style="text-align: center">
                    <asp:DataList ID="dlHinh" runat="server" RepeatLayout="Flow" RepeatColumns="2">
                        <ItemTemplate>
                            <li style="display: inline-block; margin: 2px 0">
                                <asp:Image ID="Image2" runat="server" ImageUrl='<%# "images/"+Eval("TenCty")+"/"+Eval("MaSP")+"/"+Eval("Hinh") %>' Width="485px" />
                            </li>
                        </ItemTemplate>
                    </asp:DataList>
                </ul>
            </div>
            <div id="menu3" class="container tab-pane fade">
                <br>
                <div class="danhgia">
                    <asp:Label ID="lbDanhGia" runat="server"></asp:Label>
                </div>
            </div>
            <div id="menu4" class="container tab-pane fade">
                <br>
                <ul class="dlkhuyenmai">
                    <asp:DataList ID="dlKhuyenMai" runat="server" RepeatLayout="Flow">
                        <ItemTemplate>
                            <li>
                                <asp:Label runat="server" Text='<%# Eval("NoiDung") %>'></asp:Label>
                            </li>
                        </ItemTemplate>
                    </asp:DataList>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>

