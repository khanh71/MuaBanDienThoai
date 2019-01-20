using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;

public partial class Create : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        DataTable td = XLDL.LayDuLieu("select masp from DIENTHOAI where exists (select masp from DIENTHOAI) and masp='" + txtMaSP.Text.Trim() + "'");
        if (td.Rows.Count > 0)
        {
            Response.Write("<script>alert('Mã sản phẩm đã tồn tại. Vui lòng thử lại với tên khác')</script>");
            txtMaSP.Focus();
        }
        else
        {
            try
            {
                int tragop = 0;
                double giaban = 0;
                int macty = 1;
                double giamgia = 0;
                if (cbTraGop.Checked == true)
                    tragop = 1;
                DataTable dt = XLDL.LayDuLieu("select macty from congty where tencty='" + ddlHangSX.SelectedItem + "'");
                if (dt.Rows.Count > 0)
                    macty = int.Parse(dt.Rows[0][0].ToString());
                else Response.Redirect("~/dienthoai.aspx");
                if (txtGiamGia.Text.Trim() != "")
                    giamgia = double.Parse(txtGiamGia.Text.Trim());
                if (txtGiaBan.Text.Trim() != "")
                    giaban = double.Parse(txtGiaBan.Text.Trim());
                string thumuc = "~/images/" + ddlHangSX.SelectedItem + "/" + txtMaSP.Text.Trim();
                string namepic = DateTime.Now.ToString("ddMMyyyy_hhmmss_tt_") + fuHinh.FileName;
                XLDL.Chaylenh("insert into dienthoai values('" + txtMaSP.Text.Trim() + "',N'" + txtTenSP.Text.Trim() + "'," + giaban + ",'" + namepic + "'," + macty + "," + tragop + "," + giamgia + ")");
                if (!Directory.Exists(thumuc))
                    Directory.CreateDirectory(Server.MapPath(thumuc));
                if (fuHinh.HasFile)
                {
                    if (XLDL.CheckFileType(fuHinh.FileName))
                    {
                        string tenhinh = "~/images/home/" + DateTime.Now.ToString("ddMMyyyy_hhmmss_tt_") + fuHinh.FileName;
                        fuHinh.SaveAs(Server.MapPath(tenhinh));
                    }
                }
                HttpFileCollection fileCollection = Request.Files;
                for (int i = 0; i < fileCollection.Count; i++)
                {
                    HttpPostedFile uploadfile = fileCollection[i];
                    string fileName = DateTime.Now.ToString("ddMMyyyy_hhmmss_tt_") + Path.GetFileName(uploadfile.FileName);
                    if (uploadfile.ContentLength > 0)
                    {
                        uploadfile.SaveAs(Server.MapPath(thumuc) + "/" + fileName);
                        XLDL.Chaylenh("insert into bannersp(masp,hinh) values('" + txtMaSP.Text.Trim() + "','" + fileName + "')");
                    }
                }
                XLDL.Chaylenh("insert into danhgia values('" + txtMaSP.Text.Trim() + "',N'" + CKEditor1.Text + "')");
                XLDL.Chaylenh("insert into thongso values('" + txtMaSP.Text.Trim() + "',N'" + txtManHinh.Text.Trim() + "',N'" + txtCPU.Text.Trim() + "',N'" + txtRam1.Text.Trim() + "',N'" + txtRom.Text.Trim() + "',N'" + txtHdh1.Text.Trim() + "',N'" + txtCamera.Text.Trim() + "',N'" + txtSelfie + "',N'" + txtPin1.Text.Trim() + "')");
                XLDL.Chaylenh("insert into thongsochitiet values('" + txtMaSP.Text.Trim() + "',N'" + txtCNMH.Text.Trim() + "',N'" + txtDoPhanGiai.Text.Trim() + "',N'" + txtMHRong.Text.Trim() + "',N'" + txtCamUng.Text.Trim() + "',N'" + txtDoPhanGiaiSau.Text.Trim() + "',N'" + txtQuayPhimSau.Text.Trim() + "',N'" + txtFlash.Text.Trim() + "',N'" + txtChupAnhNangCao.Text.Trim() + "',N'" + txtDoPhanGiaiTruoc.Text.Trim() + "',N'" + txtVideoCall.Text.Trim() + "',N'" + txtThongTinKhac.Text.Trim() + "',N'" + txtHdh.Text.Trim() + "',N'" + txtChipset.Text.Trim() + "',N'" + txtTocDoCPU.Text.Trim() + "',N'" + txtGpu.Text.Trim() + "',N'" + txtRam.Text.Trim() + "',N'" + txtBoNhoTrong.Text.Trim() + "',N'" + txtTheNho.Text.Trim() + "',N'" + txtSim.Text.Trim() + "',N'" + txtSac.Text.Trim() + "',N'" + txtTainghe.Text.Trim() + "',N'" + txtThietKe.Text.Trim() + "',N'" + txtChatLieu.Text.Trim() + "',N'" + txtKichThuoc.Text.Trim() + "',N'" + txtTrongLuong.Text.Trim() + "',N'" + txtPin.Text.Trim() + "',N'" + txtLoaiPin.Text.Trim() + "',N'" + txtCNPin.Text.Trim() + "',N'" + txtThoiDiem.Text.Trim() + "')");
                Response.Redirect("~/dienthoai.aspx");
            }
            catch
            {
                Response.Write("<script>alert('Lỗi trong quá trình ghi dữ liệu, vui lòng kiểm tra lại thông tin và đảm bảo rằng mọi thông tin đều chính xác')</script>");
            }
        }
    }

    protected void ddlHangSX_Load(object sender, EventArgs e)
    {
        DataTable dt = XLDL.LayDuLieu("select tencty from congty");
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddlHangSX.Items.Add(dt.Rows[i][0].ToString());
            }
        }
    }
}