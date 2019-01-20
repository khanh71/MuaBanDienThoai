using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

public partial class SuaDT : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            tendt();
            tongquat();
            thongso();
            danhgia();
            Hinh();
            Title();
            khuyenmai();
            CKFinder.FileBrowser ck = new CKFinder.FileBrowser();
            ck.BasePath = "/ckfinder";
            ck.SetupCKEditor(CKEditor1);
            alert.Visible = false;
            error.Visible = false;
        }
    }
    private void tendt()
    {
        DataTable dt = XLDL.LayDuLieu("select tensp from dienthoai where masp='" + Request.QueryString["MaSP"] + "'");
        if (dt.Rows.Count > 0)
        {
            TenDT.Text = dt.Rows[0][0].ToString() + " - Cập Nhật";
        }
        else
            Response.Redirect("~/dienthoai.aspx");
    }
    private void Title()
    {
        DataTable dt = XLDL.LayDuLieu("select TenSP from DIENTHOAI where MaSP='" + Request.QueryString["MaSP"] + "'");
        lbTitle.Controls.Add(new LiteralControl(dt.Rows[0][0].ToString()+" - Cập Nhật Thông Tin"));
    }
    private void thongso()
    {
        dlThongSo.DataSource = XLDL.LayDuLieu("select * from thongso,thongsochitiet where thongso.masp=thongsochitiet.masp and thongso.masp='" + Request.QueryString["MaSP"] + "'");
        dlThongSo.DataBind();
    }
    private void tongquat()
    {
        dlTongQuat.DataSource = XLDL.LayDuLieu("select * from dienthoai,congty,kho where congty.macty=dienthoai.macty and dienthoai.masp=kho.masp and dienthoai.masp='" + Request.QueryString["MaSP"] + "'");
        dlTongQuat.DataBind();
    }
    private void danhgia()
    {
        CKEditor1.Text = XLDL.LayDuLieu("select danhgia from danhgia where masp='" + Request.QueryString["MaSP"] + "'").Rows[0][0].ToString();
    }
    private void Hinh()
    {
        dlHinh.DataSource = XLDL.LayDuLieu("select ID,tencty,bannersp.masp,hinh from bannersp,dienthoai,congty where bannersp.masp=dienthoai.masp and dienthoai.macty=congty.macty and bannersp.masp='" + Request.QueryString["MaSP"] + "'");
        dlHinh.DataBind();
    }
    private void khuyenmai()
    {
        dlKhuyenMai.DataSource = XLDL.LayDuLieu("select ID,noidung from khuyenmaisp where masp='" + Request.QueryString["MaSP"] + "'");
        dlKhuyenMai.DataBind();
    }
    protected void dlTongQuat_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        CheckBox cbTraGop = (CheckBox)e.Item.FindControl("cbTraGop");
        DropDownList ddlHangSX = (DropDownList)e.Item.FindControl("ddlHangSX");
        DataTable dt1 = XLDL.LayDuLieu("select tencty from congty");
        if (dt1.Rows.Count > 0)
        {
            for (int i = 0; i < dt1.Rows.Count; i++)
            {
                ddlHangSX.Items.Add(dt1.Rows[i][0].ToString());
            }
        }
        DataTable dt = XLDL.LayDuLieu("select tragop,dienthoai.macty,tencty from dienthoai,congty where congty.macty=dienthoai.macty and masp='" + Request.QueryString["MaSP"] + "'");
        if(dt.Rows.Count>0)
        {
            string bit = dt.Rows[0][0].ToString();
            if (bit == "True")
                cbTraGop.Checked = true;
            else
                cbTraGop.Checked = false;
            ddlHangSX.SelectedValue = dt.Rows[0][2].ToString();
        }
    }

    protected void dlTongQuat_UpdateCommand(object source, DataListCommandEventArgs e)
    {
        try
        {
            string masp = dlTongQuat.DataKeys[e.Item.ItemIndex].ToString();
            TextBox txtTenSP = (TextBox)e.Item.FindControl("txtTenSP");
            DropDownList ddlHangSX = (DropDownList)e.Item.FindControl("ddlHangSX");
            TextBox txtGiaBan = (TextBox)e.Item.FindControl("txtGiaBan");
            CheckBox cbTraGop = (CheckBox)e.Item.FindControl("cbTraGop");
            TextBox txtGiamGia = (TextBox)e.Item.FindControl("txtGiamGia");
            TextBox txtSLTon = (TextBox)e.Item.FindControl("txtSLTon");
            FileUpload fuHinh = (FileUpload)e.Item.FindControl("fuHinh");
            int tragop = 0;
            double giamgia = 0;
            if (cbTraGop.Checked == true)
                tragop = 1;
            int macty = 1;
            DataTable dt = XLDL.LayDuLieu("select macty from congty where tencty='" + ddlHangSX.SelectedItem + "'");
            if (dt.Rows.Count > 0)
                macty = int.Parse(dt.Rows[0][0].ToString());
            if (txtGiamGia.Text.Trim() != "")
                giamgia = double.Parse(txtGiamGia.Text.Trim());
            if (fuHinh.HasFile)
            {
                if (XLDL.CheckFileType(fuHinh.FileName))
                {
                    string tenhinh = "~/images/home/" + DateTime.Now.ToString("ddMMyyyy_hhmmss_tt_") + fuHinh.FileName;
                    fuHinh.SaveAs(Server.MapPath(tenhinh));
                    XLDL.Chaylenh("update dienthoai set tensp=N'" + txtTenSP.Text.Trim() + "',giaban=" + double.Parse(txtGiaBan.Text.Trim()) + ",hinhanh='" + fuHinh.FileName + "',macty=" + macty + ",tragop=" + tragop + ",giamgia=" + giamgia + " where masp='" + masp + "'");
                }
            }
            else
                XLDL.Chaylenh("update dienthoai set tensp=N'" + txtTenSP.Text.Trim() + "',giaban=" + double.Parse(txtGiaBan.Text.Trim()) + ",macty=" + macty + ",tragop=" + tragop + ",giamgia=" + giamgia + " where masp='" + masp + "'");
            XLDL.Chaylenh("update kho set soluongton=" + int.Parse(txtSLTon.Text.Trim()) + " where masp='" + masp + "'");
            tongquat();
            alert.Visible = true;
        }
        catch
        {
            error.Visible = true;
        }
    }

    protected void dlThongSo_UpdateCommand(object source, DataListCommandEventArgs e)
    {
        try
        {
            string masp = dlThongSo.DataKeys[e.Item.ItemIndex].ToString();
            TextBox txtManHinh = (TextBox)e.Item.FindControl("txtManHinh");
            TextBox txtCPU = (TextBox)e.Item.FindControl("txtCPU");
            TextBox txtRam1 = (TextBox)e.Item.FindControl("txtRam1");
            TextBox txtRom = (TextBox)e.Item.FindControl("txtRom");
            TextBox txtHdh1 = (TextBox)e.Item.FindControl("txtHdh1");
            TextBox txtCamera = (TextBox)e.Item.FindControl("txtCamera");
            TextBox txtSelfie = (TextBox)e.Item.FindControl("txtSelfie");
            TextBox txtPin1 = (TextBox)e.Item.FindControl("txtPin1");
            XLDL.Chaylenh("update thongso set manhinh=N'" + txtManHinh.Text.Trim() + "',cpu=N'" + txtCPU.Text.Trim() + "',ram1=N'" + txtRam1.Text.Trim() + "',rom=N'" + txtRom.Text.Trim() + "',hdh1=N'" + txtHdh1.Text.Trim() + "',camera=N'" + txtCamera.Text.Trim() + "',selfie=N'" + txtSelfie.Text.Trim() + "',pin1=N'" + txtPin1.Text.Trim() + "' where masp='" + masp + "'");

            TextBox txtCNMH = (TextBox)e.Item.FindControl("txtCNMH");
            TextBox txtDoPhanGiai = (TextBox)e.Item.FindControl("txtDoPhanGiai");
            TextBox txtMHRong = (TextBox)e.Item.FindControl("txtMHRong");
            TextBox txtCamUng = (TextBox)e.Item.FindControl("txtCamUng");
            TextBox txtDoPhanGiaiSau = (TextBox)e.Item.FindControl("txtDoPhanGiaiSau");
            TextBox txtQuayPhimSau = (TextBox)e.Item.FindControl("txtQuayPhimSau");
            TextBox txtFlash = (TextBox)e.Item.FindControl("txtFlash");
            TextBox txtChupAnhNangCao = (TextBox)e.Item.FindControl("txtChupAnhNangCao");
            TextBox txtDoPhanGiaiTruoc = (TextBox)e.Item.FindControl("txtDoPhanGiaiTruoc");
            TextBox txtVideoCall = (TextBox)e.Item.FindControl("txtVideoCall");
            TextBox txtThongTinKhac = (TextBox)e.Item.FindControl("txtThongTinKhac");
            TextBox txtHdh = (TextBox)e.Item.FindControl("txtHdh");
            TextBox txtChipset = (TextBox)e.Item.FindControl("txtChipset");
            TextBox txtTocDoCPU = (TextBox)e.Item.FindControl("txtTocDoCPU");
            TextBox txtGpu = (TextBox)e.Item.FindControl("txtGpu");
            TextBox txtRam = (TextBox)e.Item.FindControl("txtRam");
            TextBox txtBoNhoTrong = (TextBox)e.Item.FindControl("txtBoNhoTrong");
            TextBox txtTheNho = (TextBox)e.Item.FindControl("txtTheNho");
            TextBox txtSim = (TextBox)e.Item.FindControl("txtSim");
            TextBox txtSac = (TextBox)e.Item.FindControl("txtSac");
            TextBox txtTainghe = (TextBox)e.Item.FindControl("txtTainghe");
            TextBox txtThietKe = (TextBox)e.Item.FindControl("txtThietKe");
            TextBox txtChatLieu = (TextBox)e.Item.FindControl("txtChatLieu");
            TextBox txtKichThuoc = (TextBox)e.Item.FindControl("txtKichThuoc");
            TextBox txtTrongLuong = (TextBox)e.Item.FindControl("txtTrongLuong");
            TextBox txtPin = (TextBox)e.Item.FindControl("txtPin");
            TextBox txtLoaiPin = (TextBox)e.Item.FindControl("txtLoaiPin");
            TextBox txtCNPin = (TextBox)e.Item.FindControl("txtCNPin");
            TextBox txtThoiDiem = (TextBox)e.Item.FindControl("txtThoiDiem");
            XLDL.Chaylenh("update thongsochitiet set cnmanhinh=N'" + txtCNMH.Text.Trim() + "',dophangiaimh=N'" + txtDoPhanGiai.Text.Trim() + "',mhrong=N'" + txtMHRong.Text.Trim() + "',camung=N'" + txtCamUng.Text.Trim() + "',dophangiaicamsau=N'" + txtDoPhanGiaiSau.Text.Trim() + "',quayphimsau=N'" + txtQuayPhimSau.Text.Trim() + "',denflash=N'" + txtFlash.Text.Trim() + "',chupanhnangcao=N'" + txtChupAnhNangCao.Text.Trim() + "',dophangiaicamtruoc=N'" + txtDoPhanGiaiTruoc.Text.Trim() + "',videocall=N'" + txtVideoCall.Text.Trim() + "',thongtinkhac=N'" + txtThongTinKhac.Text.Trim() + "',hdh=N'" + txtHdh.Text.Trim() + "',chipset=N'" + txtChipset.Text.Trim() + "',tocdocpu=N'" + txtTocDoCPU.Text.Trim() + "',gpu=N'" + txtGpu.Text.Trim() + "',ram=N'" + txtRam.Text.Trim() + "',bonhotrong=N'" + txtBoNhoTrong.Text.Trim() + "',thenho=N'" + txtTheNho.Text.Trim() + "',sim=N'" + txtSim.Text.Trim() + "',sac=N'" + txtSac.Text.Trim() + "',tainghe=N'" + txtTainghe.Text.Trim() + "',chatlieu=N'" + txtChatLieu.Text.Trim() + "',kichthuoc=N'" + txtKichThuoc.Text.Trim() + "',trongluong=N'" + txtTrongLuong.Text.Trim() + "',pin=N'" + txtPin.Text.Trim() + "',loaipin=N'" + txtLoaiPin.Text.Trim() + "',congnghepin=N'" + txtCNPin.Text.Trim() + "',thoidiemramat=N'" + txtThoiDiem.Text.Trim() + "' where masp='" + masp + "'");

            thongso();
            alert.Visible = true;
        }
        catch
        {
            error.Visible = true;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            XLDL.Chaylenh("update danhgia set danhgia=N'" + CKEditor1.Text + "' where masp='" + Request.QueryString["MaSP"] + "'");
            danhgia();
            alert.Visible = true;
        }
        catch
        {
            error.Visible = true;
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            int bit = 0;
            foreach (DataListItem item in dlHinh.Items)
            {
                int id = int.Parse(dlHinh.DataKeys[item.ItemIndex].ToString());
                CheckBox cbHinh = (CheckBox)item.FindControl("cbHinh");
                if (cbHinh.Checked == true)
                    bit = 1;
                else
                    bit = 0;
                XLDL.Chaylenh("update bannersp set hien=" + bit + " where id=" + id);
            }
            DataTable dt = XLDL.LayDuLieu("select tencty,masp from congty,dienthoai where congty.macty=dienthoai.macty and masp='" + Request.QueryString["masp"] + "'");
            string tenhinh = "~/images/" + dt.Rows[0][0].ToString() + "/" + dt.Rows[0][1].ToString() + "/";
            HttpFileCollection fileCollection = Request.Files;
            for (int i = 0; i < fileCollection.Count; i++)
            {
                HttpPostedFile uploadfile = fileCollection[i];
                string fileName = Path.GetFileName(uploadfile.FileName);
                string urlname = DateTime.Now.ToString("ddMMyyyy_hhmmss_tt_") + fileName;
                if (uploadfile.ContentLength > 0)
                {
                    uploadfile.SaveAs(Server.MapPath(tenhinh) + urlname);
                    XLDL.Chaylenh("insert into bannersp(masp,hinh) values('" + dt.Rows[0][1] + "','" + urlname + "')");
                }
            }
            Hinh();
            alert.Visible = true;
        }
        catch
        {
            error.Visible = true;
        }
    }

    protected void dlHinh_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        int id = int.Parse(dlHinh.DataKeys[e.Item.ItemIndex].ToString());
        CheckBox cbHinh = (CheckBox)e.Item.FindControl("cbHinh");
        string bit = XLDL.LayDuLieu("select hien from bannersp where id=" + id).Rows[0][0].ToString();
        if (bit == "True")
            cbHinh.Checked = true;
        else
            cbHinh.Checked = false;
    }

    protected void dlKhuyenMai_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        try
        {
            int ID = int.Parse(dlKhuyenMai.DataKeys[e.Item.ItemIndex].ToString());
            XLDL.Chaylenh("delete from khuyenmaisp where id=" + ID);
            Response.Redirect(HttpContext.Current.Request.Url.AbsoluteUri);
        }
        catch
        {

        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtNDKhuyenMai.Text.Trim() != "")
                XLDL.Chaylenh("insert into khuyenmaisp(masp,noidung) values('" + Request.QueryString["masp"] + "',N'" + txtNDKhuyenMai.Text.Trim() + "')");
            foreach(DataListItem item in dlKhuyenMai.Items)
            {
                int id = int.Parse(dlKhuyenMai.DataKeys[item.ItemIndex].ToString());
                TextBox txtKm = (TextBox)item.FindControl("txtKm");
                XLDL.Chaylenh("update khuyenmaisp set noidung=N'" + txtKm.Text.Trim() + "' where id=" + id);
            }
            khuyenmai();
            alert.Visible = true;
        }
        catch
        {
            error.Visible = true;
        }
    }

    protected void dlHinh_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        try
        {
            int ID = int.Parse(dlHinh.DataKeys[e.Item.ItemIndex].ToString());
            DataTable dt = XLDL.LayDuLieu("select tencty,dienthoai.masp,hinh from bannersp,dienthoai,congty where bannersp.masp=dienthoai.masp and dienthoai.macty=congty.macty and id=" + ID);
            string tenhinh = "~/images/" + dt.Rows[0][0].ToString() + "/" + dt.Rows[0][1].ToString() + "/" + dt.Rows[0][2].ToString();
            if (File.Exists(Server.MapPath(tenhinh)) == true)
                File.Delete(Server.MapPath(tenhinh));
            XLDL.Chaylenh("delete from bannersp where id=" + ID);
            Hinh();
        }
        catch { }
    }

    protected void linkedit_Load(object sender, EventArgs e)
    {
        linkedit.NavigateUrl = "~/viewdt.aspx?masp=" + Request.QueryString["masp"];
    }
}