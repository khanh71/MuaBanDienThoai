<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="CreateDT.aspx.cs" Inherits="Create" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Thêm Mới Sản Phẩm</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <h2 style="font-weight: bold; text-transform: uppercase">thêm mới sản phẩm</h2>
    <ul class="list">
        <li>
            <ul>
                <li class="listli">
                    <div class="listdiv">THÔNG TIN CƠ BẢN</div>
                    <ul class="ttcoban">
                        <li>
                            <label>Mã Sản Phẩm:<span style="font-size: 13px">(*)</span></label><asp:RequiredFieldValidator runat="server" Text="Vui lòng nhập mã sản phẩm" ForeColor="Red" ControlToValidate="txtMaSp"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtMaSP" runat="server" Text='<%# Eval("MaSP") %>' CssClass="form-control"></asp:TextBox>
                        </li>
                        <li>
                            <label>Tên Sản Phẩm:<span style="font-size: 13px">(*)</span></label><asp:RequiredFieldValidator runat="server" Text="Vui lòng nhập tên sản phẩm" ForeColor="Red" ControlToValidate="txtTenSP"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtTenSP" runat="server" Text='<%# Eval("TenSP") %>' CssClass="form-control"></asp:TextBox>
                        </li>
                        <li>
                            <label>Hình Ảnh:<span style="font-size: 13px">(*)</span></label><asp:RequiredFieldValidator runat="server" Text="Vui lòng thêm hình ảnh sản phẩm" ForeColor="Red" ControlToValidate="fuHinh"></asp:RequiredFieldValidator>
                            <asp:FileUpload ID="fuHinh" runat="server" />
                        </li>
                        <li>
                            <label>Hãng Sản Xuất:</label>
                            <asp:DropDownList ID="ddlHangSX" runat="server" CssClass="custom-select" OnLoad="ddlHangSX_Load">
                            </asp:DropDownList>
                        </li>
                        <li>
                            <label>Giá Bán: </label>
                            <asp:RegularExpressionValidator runat="server" ErrorMessage="Vui lòng nhập số" ValidationExpression="^\d{1,20}" ControlToValidate="txtGiaBan" ForeColor="Red"></asp:RegularExpressionValidator>
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
                            <asp:RegularExpressionValidator runat="server" ErrorMessage="Vui lòng nhập số" ValidationExpression="^\d{1,20}" ControlToValidate="txtGiamGia" ForeColor="Red"></asp:RegularExpressionValidator>
                            <asp:TextBox ID="txtGiamGia" runat="server" Text='<%# Eval("GiamGia","{0:#}") %>' CssClass="form-control"></asp:TextBox>
                        </li>
                    </ul>
                </li>
                <li class="listli">
                    <div class="listdiv">HÌNH ẢNH SẢN PHẨM</div>
                    <asp:FileUpload ID="FileUpload1" class="multi" runat="server" Font-Size="16px" />
                </li>
                <li class="listli">
                    <div class="listdiv">ĐÁNH GIÁ</div>
                    <CKEditor:CKEditorControl ID="CKEditor1" runat="server" Height="300px"></CKEditor:CKEditorControl>
                </li>
            </ul>
        </li>
        <li style="border: 1px solid #136f70; padding: 0 5px 5px 5px;">
            <div class="listdiv">THÔNG SỐ KỸ THUẬT</div>
            <h5 style="color: #ff006e; margin-bottom: 0">Thông Số Cơ Bản</h5>
            <ul class="ttcoban">
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
            </ul>
            <hr />
            <h5 style="color: #ff006e; margin-bottom: 0;">Thông Số Đầy Đủ</h5>
            <ul class="ttcoban">
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
    </ul>
    <div style="text-align: center">
        <asp:Button ID="Button1" runat="server" Text="THÊM" class="save" OnClick="Button1_Click" />
    </div>
    <asp:ValidationSummary runat="server" HeaderText="Vui lòng nhập đầy đủ các thông tin yêu cầu" ForeColor="Red" />
</asp:Content>

