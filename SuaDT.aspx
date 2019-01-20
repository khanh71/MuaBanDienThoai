<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="SuaDT.aspx.cs" Inherits="SuaDT" %>

<%@ Register Assembly="CKFinder" Namespace="CKFinder" TagPrefix="CKFinder" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title id="lbTitle" runat="server"></title>
    <script type="text/javascript">
        window.setTimeout(function () {
            $(".alert").fadeTo(500, 0).slideUp(500, function () {
                $(this).remove();
            });
        }, 4000);
        window.setTimeout(function () {
            $(".alert1").fadeTo(500, 0).slideUp(500, function () {
                $(this).remove();
            });
        }, 10000);
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="container">
        <asp:Label ID="TenDT" runat="server" Font-Size="35px"></asp:Label>
        <div class="alert alert-success alert-dismissible" runat="server" id="alert" role="alert">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>Thành công!</strong> Cập nhật thông tin thành công.
        </div>
        <div class="alert alert-danger alert-dismissible" runat="server" id="error" role="alert1">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>Lỗi!</strong> Vui lòng kiểm tra lại thông tin.
        </div>
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
            <li class="nav-item" style="margin-left: 10px; margin-top: 4px">
                <asp:HyperLink runat="server" ImageUrl="~/hinhadmin/completed.png" ID="linkedit" OnLoad="linkedit_Load"></asp:HyperLink>
            </li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
            <div id="home" class="container tab-pane active">
                <br>
                <asp:DataList ID="dlTongQuat" runat="server" OnItemDataBound="dlTongQuat_ItemDataBound" RepeatLayout="Flow" DataKeyField="MaSP" OnUpdateCommand="dlTongQuat_UpdateCommand">
                    <ItemTemplate>
                        <ul class="dltongquat">
                            <li>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# "images/home/"+ Eval("HinhAnh") %>' />
                            </li>
                            <li>
                                <ul>
                                    <li>
                                        <label>Mã Sản Phẩm: </label>
                                        <asp:Label runat="server" Text='<%# Eval("MaSP") %>' CssClass="form-control"></asp:Label>
                                    </li>
                                    <li>
                                        <label>Tên Sản Phẩm: </label>
                                        <asp:TextBox ID="txtTenSP" runat="server" Text='<%# Eval("TenSP") %>' CssClass="form-control"></asp:TextBox>
                                    </li>
                                    <li>
                                        <label style="display: block">Hình Ảnh: </label>
                                        <asp:FileUpload ID="fuHinh" runat="server" Font-Size="17px" />
                                    </li>
                                    <li>
                                        <label>Hãng Sản Xuất: </label>
                                        <asp:DropDownList ID="ddlHangSX" runat="server" CssClass="custom-select" ForeColor="Black" Font-Size="17px">
                                        </asp:DropDownList>
                                    </li>
                                    <li>
                                        <label>Giá Bán: </label>
                                        <asp:TextBox ID="txtGiaBan" runat="server" Text='<%# Eval("GiaBan","{0:#}") %>' CssClass="form-control"></asp:TextBox>
                                    </li>
                                    <li>
                                        <label>Trả Góp 0%: </label>
                                        <div class="SingleCheckbox" style="display: inline-block; margin-left: -20px; margin-bottom: -3px">
                                            <asp:CheckBox ID="cbTraGop" runat="server" />
                                            <asp:Label AssociatedControlID="cbTraGop" runat="server" CssClass="CheckBoxLabel"></asp:Label>
                                        </div>
                                    </li>
                                    <li>
                                        <label>Giảm Giá: </label>
                                        <asp:TextBox ID="txtGiamGia" runat="server" Text='<%# Eval("GiamGia","{0:#}") %>' CssClass="form-control"></asp:TextBox>
                                    </li>
                                    <li>
                                        <label>Số Lượng Tồn: </label>
                                        <asp:TextBox ID="txtSLTon" runat="server" Text='<%# Eval("SoLuongTon") %>' CssClass="form-control"></asp:TextBox>
                                    </li>
                                    <li>
                                        <label>Số Lượng Bán: </label>
                                        <asp:Label ID="txtSLBan" runat="server" Text='<%# Eval("SoLuongBan") %>' CssClass="form-control"></asp:Label>
                                    </li>
                                    <li style="list-style: none; margin-top: 10px">
                                        <div style="text-align: center">
                                            <asp:Button ID="Button1" runat="server" Text="Lưu" CommandName="update" CssClass="save" />
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </ItemTemplate>
                </asp:DataList>
            </div>
            <div id="menu1" class="container tab-pane fade">
                <br>
                <asp:DataList ID="dlThongSo" runat="server" RepeatLayout="Flow" DataKeyField="MaSP" OnUpdateCommand="dlThongSo_UpdateCommand">
                    <ItemTemplate>
                        <ul class="dltongquat">
                            <li class="col-7">
                                <ul style="font-size: 19px">
                                    <li style="color: red; list-style: none; font-weight: bold">Màn hình</li>
                                    <li>
                                        <label>Công nghệ màn hình: </label>
                                        <asp:TextBox ID="txtCNMH" runat="server" Text='<%# Eval("CNManHinh") %>' CssClass="form-control"></asp:TextBox>
                                    </li>
                                    <li>
                                        <label>Độ phân giải: </label>
                                        <asp:TextBox ID="txtDoPhanGiai" runat="server" Text='<%# Eval("DoPhanGiaiMH") %>' CssClass="form-control"></asp:TextBox>
                                    </li>
                                    <li>
                                        <label>Màn hình rộng: </label>
                                        <asp:TextBox ID="txtMHRong" runat="server" Text='<%# Eval("MHRong") %>' CssClass="form-control"></asp:TextBox>
                                    </li>
                                    <li>
                                        <label>Mặt kính cảm ứng: </label>
                                        <asp:TextBox ID="txtCamUng" runat="server" Text='<%# Eval("CamUng") %>' CssClass="form-control"></asp:TextBox>
                                    </li>

                                    <li style="color: red; list-style: none; font-weight: bold">Camera sau</li>
                                    <li>
                                        <label>Độ phân giải: </label>
                                        <asp:TextBox ID="txtDoPhanGiaiSau" runat="server" Text='<%# Eval("DoPhanGiaiCamSau") %>' CssClass="form-control"></asp:TextBox>
                                    </li>
                                    <li>
                                        <label>Quay phim: </label>
                                        <asp:TextBox ID="txtQuayPhimSau" runat="server" Text='<%# Eval("QuayPhimSau") %>' CssClass="form-control"></asp:TextBox>
                                    </li>
                                    <li>
                                        <label>Đèn Flash: </label>
                                        <asp:TextBox ID="txtFlash" runat="server" Text='<%# Eval("DenFlash") %>' CssClass="form-control"></asp:TextBox>
                                    </li>
                                    <li>
                                        <label>Chụp ảnh nâng cao: </label>
                                        <asp:TextBox ID="txtChupAnhNangCao" runat="server" Text='<%# Eval("ChupAnhNangCao") %>' CssClass="form-control" TextMode="MultiLine" Rows="3" ForeColor="Black"></asp:TextBox>
                                    </li>

                                    <li style="color: red; font-weight: bold; list-style: none">Camera trước</li>
                                    <li>
                                        <label>Độ phân giải: </label>
                                        <asp:TextBox ID="txtDoPhanGiaiTruoc" runat="server" Text='<%# Eval("DoPhanGiaiCamTruoc") %>' CssClass="form-control"></asp:TextBox>
                                    </li>
                                    <li>
                                        <label>Videocall: </label>
                                        <asp:TextBox ID="txtVideoCall" runat="server" Text='<%# Eval("VideoCall") %>' CssClass="form-control"></asp:TextBox>
                                    </li>
                                    <li>
                                        <label>Thông tin khác: </label>
                                        <asp:TextBox ID="txtThongTinKhac" runat="server" Text='<%# Eval("ThongTinKhac") %>' CssClass="form-control" ForeColor="Black" TextMode="MultiLine" Rows="3"></asp:TextBox>
                                    </li>

                                    <li style="color: red; font-weight: bold; list-style: none">Hệ điều hành - CPU</li>
                                    <li>
                                        <label>Hệ điều hành: </label>
                                        <asp:TextBox ID="txtHdh" runat="server" Text='<%# Eval("HDH") %>' CssClass="form-control"></asp:TextBox>
                                    </li>
                                    <li>
                                        <label>Chipset: </label>
                                        <asp:TextBox ID="txtChipset" runat="server" Text='<%# Eval("ChipSet") %>' CssClass="form-control"></asp:TextBox>
                                    </li>
                                    <li>
                                        <label>Tốc độ CPU: </label>
                                        <asp:TextBox ID="txtTocDoCPU" runat="server" Text='<%# Eval("TocDoCPU") %>' CssClass="form-control"></asp:TextBox>
                                    </li>
                                    <li>
                                        <label>Chip đồ họa (GPU): </label>
                                        <asp:TextBox ID="txtGpu" runat="server" Text='<%# Eval("GPU") %>' CssClass="form-control"></asp:TextBox>
                                    </li>

                                    <li style="color: red; font-weight: bold; list-style: none">Bộ nhớ & Lưu trữ</li>
                                    <li>
                                        <label>RAM: </label>
                                        <asp:TextBox ID="txtRam" runat="server" Text='<%# Eval("Ram") %>' CssClass="form-control"></asp:TextBox>
                                    </li>
                                    <li>
                                        <label>Bộ nhớ trong: </label>
                                        <asp:TextBox ID="txtBoNhoTrong" runat="server" Text='<%# Eval("BoNhoTrong") %>' CssClass="form-control"></asp:TextBox>
                                    </li>
                                    <li>
                                        <label>Thẻ nhớ ngoài: </label>
                                        <asp:TextBox ID="txtTheNho" runat="server" Text='<%# Eval("TheNho") %>' CssClass="form-control"></asp:TextBox>
                                    </li>

                                    <li style="color: red; font-weight: bold; list-style: none">Kết nối</li>
                                    <li>
                                        <label>SIM: </label>
                                        <asp:TextBox ID="txtSim" runat="server" Text='<%# Eval("Sim") %>' CssClass="form-control"></asp:TextBox>
                                    </li>
                                    <li>
                                        <label>Cổng kết nối/sạc: </label>
                                        <asp:TextBox ID="txtSac" runat="server" Text='<%# Eval("Sac") %>' CssClass="form-control"></asp:TextBox>
                                    </li>
                                    <li>
                                        <label>Jack tai nghe: </label>
                                        <asp:TextBox ID="txtTainghe" runat="server" Text='<%# Eval("TaiNghe") %>' CssClass="form-control"></asp:TextBox>
                                    </li>

                                    <li style="color: red; font-weight: bold; list-style: none">Thiết kế & Trọng lượng</li>
                                    <li>
                                        <label>Thiết kế: </label>
                                        <asp:TextBox ID="txtThietKe" runat="server" Text='<%# Eval("ThietKe") %>' CssClass="form-control"></asp:TextBox>
                                    </li>
                                    <li>
                                        <label>Chất liệu: </label>
                                        <asp:TextBox ID="txtChatLieu" runat="server" Text='<%# Eval("ChatLieu") %>' CssClass="form-control"></asp:TextBox>
                                    </li>
                                    <li>
                                        <label>Kích thước: </label>
                                        <asp:TextBox ID="txtKichThuoc" runat="server" Text='<%# Eval("KichThuoc") %>' CssClass="form-control"></asp:TextBox>
                                    </li>
                                    <li>
                                        <label>Trọng lượng: </label>
                                        <asp:TextBox ID="txtTrongLuong" runat="server" Text='<%# Eval("TrongLuong") %>' CssClass="form-control"></asp:TextBox>
                                    </li>

                                    <li style="color: red; font-weight: bold; list-style: none">Thông tin pin & Sạc</li>
                                    <li>
                                        <label>Dung lượng pin: </label>
                                        <asp:TextBox ID="txtPin" runat="server" Text='<%# Eval("Pin") %>' CssClass="form-control"></asp:TextBox>
                                    </li>
                                    <li>
                                        <label>Loại pin: </label>
                                        <asp:TextBox ID="txtLoaiPin" runat="server" Text='<%# Eval("LoaiPin") %>' CssClass="form-control"></asp:TextBox>
                                    </li>
                                    <li>
                                        <label>Công nghệ pin: </label>
                                        <asp:TextBox ID="txtCNPin" runat="server" Text='<%# Eval("CongNghePin") %>' CssClass="form-control"></asp:TextBox>
                                    </li>

                                    <li style="color: red; font-weight: bold; list-style: none">Thông tin khác</li>
                                    <li>
                                        <label>Thời điểm ra mắt: </label>
                                        <asp:TextBox ID="txtThoiDiem" runat="server" Text='<%# Eval("ThoiDiemRaMat") %>' CssClass="form-control"></asp:TextBox>
                                    </li>
                                </ul>
                            </li>
                            <li class="col-4">
                                <ul style="font-size: 19px">
                                    <li>
                                        <label>Màn Hình: </label>
                                        <asp:TextBox ID="txtManHinh" runat="server" Text='<%# Eval("ManHinh") %>' CssClass="form-control"></asp:TextBox>
                                    </li>
                                    <li>
                                        <label>CPU: </label>
                                        <asp:TextBox ID="txtCPU" runat="server" Text='<%# Eval("CPU") %>' CssClass="form-control"></asp:TextBox>
                                    </li>
                                    <li>
                                        <label>RAM: </label>
                                        <asp:TextBox ID="txtRam1" runat="server" Text='<%# Eval("RAM1") %>' CssClass="form-control"></asp:TextBox>
                                    </li>
                                    <li>
                                        <label>ROM: </label>
                                        <asp:TextBox ID="txtRom" runat="server" Text='<%# Eval("ROM") %>' CssClass="form-control"></asp:TextBox>
                                    </li>
                                    <li>
                                        <label>Hệ Điều Hành: </label>
                                        <asp:TextBox ID="txtHdh1" runat="server" Text='<%# Eval("HDH1") %>' CssClass="form-control"></asp:TextBox>
                                    </li>
                                    <li>
                                        <label>Camera: </label>
                                        <asp:TextBox ID="txtCamera" runat="server" Text='<%# Eval("Camera") %>' CssClass="form-control"></asp:TextBox>
                                    </li>
                                    <li>
                                        <label>Selfie: </label>
                                        <asp:TextBox ID="txtSelfie" runat="server" Text='<%# Eval("Selfie") %>' CssClass="form-control"></asp:TextBox>
                                    </li>
                                    <li>
                                        <label>Pin: </label>
                                        <asp:TextBox ID="txtPin1" runat="server" Text='<%# Eval("Pin1") %>' CssClass="form-control"></asp:TextBox>
                                    </li>
                                    <li style="list-style: none; margin-top: 10px">
                                        <asp:Button ID="Button2" runat="server" Text="Lưu" class="save" CommandName="update" />
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
                    <asp:DataList ID="dlHinh" runat="server" RepeatLayout="Flow" RepeatColumns="2" DataKeyField="ID" OnItemDataBound="dlHinh_ItemDataBound" RepeatDirection="Horizontal" OnDeleteCommand="dlHinh_DeleteCommand">
                        <ItemTemplate>
                            <li style="display: inline-block; margin: 2px 0">
                                <asp:Image ID="Image2" runat="server" ImageUrl='<%# "images/"+Eval("TenCty")+"/"+Eval("MaSP")+"/"+Eval("Hinh") %>' Width="485px" /><br />
                                <div class="SingleCheckbox" style="margin-top: 5px">
                                    <asp:CheckBox ID="cbHinh" runat="server" />
                                    <asp:Label ID="Label3" AssociatedControlID="cbHinh" runat="server" CssClass="CheckBoxLabel"></asp:Label>
                                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/hinhadmin/delete.png" CommandName="delete" CssClass="delhinh" />
                                </div>
                            </li>
                        </ItemTemplate>
                    </asp:DataList>
                </ul>
                <h5>
                    <img src="hinhadmin/add1.png" style="margin-top: -5px" />
                    Thêm Hình Ảnh</h5>
                <asp:FileUpload ID="file_upload" class="multi" runat="server" />
                <div style="text-align: center; margin-top: 10px">
                    <asp:Button ID="Button2" runat="server" Text="Lưu" class="save" OnClick="Button2_Click" />
                </div>
            </div>
            <div id="menu3" class="container tab-pane fade">
                <br>
                <CKEditor:CKEditorControl ID="CKEditor1" runat="server" Height="500px" Language="vi" BasePath="~/ckeditor"></CKEditor:CKEditorControl>
                <div style="text-align: center; margin-top: 10px">
                    <asp:Button ID="Button1" runat="server" Text="Lưu" class="save" OnClick="Button1_Click" />
                </div>
            </div>
            <div id="menu4" class="container tab-pane fade">
                <br>
                <ul class="dlkhuyenmai">
                    <asp:DataList ID="dlKhuyenMai" runat="server" RepeatLayout="Flow" DataKeyField="ID" OnDeleteCommand="dlKhuyenMai_DeleteCommand">
                        <ItemTemplate>
                            <li>
                                <asp:Label ID="lbTitle" runat="server" Text="Khuyến Mãi"></asp:Label>
                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/hinhadmin/delete.png" CommandName="delete" />
                                <asp:TextBox ID="txtKm" runat="server" Text='<%# Eval("NoiDung") %>' CssClass="form-control"></asp:TextBox>
                            </li>
                        </ItemTemplate>
                    </asp:DataList>
                </ul>
                <div style="padding-top: 20px">
                    <h5>
                        <img src="hinhadmin/add1.png" style="margin-top: -5px" />
                        Thêm Khuyến Mãi
                    </h5>
                </div>
                <asp:TextBox ID="txtNDKhuyenMai" runat="server" CssClass="form-control"></asp:TextBox>
                <div style="margin-top: 10px; text-align: center">
                    <asp:Button ID="Button3" runat="server" Text="Lưu" CssClass="save" OnClick="Button3_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

