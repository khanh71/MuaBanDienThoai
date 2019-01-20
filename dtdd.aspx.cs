using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class dtdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CreateBanner();
            SanPham();
            KhuyenMai();
            ThongSo();
            DanhGia();
            Title();
            binhluan();
            if (Session["TenDN"] == null)
            {
                dBinhluan.Visible = false;
                dthongbao.Visible = true;
            }
            else
            {
                dBinhluan.Visible = true;
                dthongbao.Visible = false;
            }
            HyperLink1.NavigateUrl = "~/Giohang.aspx?MaSP=" + Request.QueryString["MaSP"];
            slbl();
        }
        this.Page.MaintainScrollPositionOnPostBack = true;
    }
    private void slbl()
    {
        lbSLBinhLuan.Text = String.Format("{0:#,#}", XLDL.LayDuLieu("select count(ID) from binhluan where masp = '" + Request.QueryString["MaSP"] + "'").Rows[0][0].ToString()) + " Bình Luận";
    }
    private void binhluan()
    {
        dlBinhLuan.DataSource = XLDL.LayDuLieu("select ID,hoten,binhluan,thoigian,thich from khachhang,binhluan where khachhang.makh=binhluan.makh and binhluan.masp = '" + Request.QueryString["MaSP"] + "' order by thoigian desc");
        dlBinhLuan.DataBind();
    }
    private void Title()
    {
        DataTable dt = XLDL.LayDuLieu("select TenSP from DIENTHOAI where MaSP='" + Request.QueryString["MaSP"] + "'");
        lbTitle.Controls.Add(new LiteralControl(dt.Rows[0][0].ToString()));
    }
    private void CreateBanner()
    {
        DataTable dt = XLDL.LayDuLieu("select TenCty,BANNERSP.MaSP,BANNERSP.Hinh from BANNERSP,DIENTHOAI,CONGTY where BANNERSP.MaSP=DIENTHOAI.MaSP and DIENTHOAI.MaCty=CONGTY.MaCty and Hien=1 and DIENTHOAI.MaSP='" + Request.QueryString["MaSP"] + "'");
        int iCount = 0;
        int i = 0;
        if (dt.Rows.Count > 0)
        {
            iCount = dt.Rows.Count;
            lbBanner.Controls.Add(new LiteralControl("<div id=\"demo\" class=\"carousel slide\" data-ride=\"carousel\">"));
            lbBanner.Controls.Add(new LiteralControl("<ul class=\"carousel-indicators\">"));
            for (i = 0; i < iCount; i++)
            {
                if (i == 0)
                {
                    lbBanner.Controls.Add(new LiteralControl("<li data-target=\"#demo\" data-slide-to=" + i + " class=\"active\"></li>"));
                }
                else
                {
                    lbBanner.Controls.Add(new LiteralControl("<li data-target=\"#demo\" data-slide-to=" + i + "></li>"));
                }
            }
            lbBanner.Controls.Add(new LiteralControl("</ul>"));
            lbBanner.Controls.Add(new LiteralControl("<div class=\"carousel-inner\">"));
            i = 0;
            foreach (DataRow r in dt.Rows)
            {
                if (i == 0)
                {
                    lbBanner.Controls.Add(new LiteralControl("<div class=\"carousel-item active\">"));
                }
                else
                {
                    lbBanner.Controls.Add(new LiteralControl("<div class=\"carousel-item\">"));
                }
                lbBanner.Controls.Add(new LiteralControl("<img src=\"images/" + r[0].ToString() + "/" + r[1].ToString() + "/" + r[2].ToString() + "\" width=\"896px\" > "));
                lbBanner.Controls.Add(new LiteralControl("</div>"));
                i++;
            }
            lbBanner.Controls.Add(new LiteralControl("</div>"));
            lbBanner.Controls.Add(new LiteralControl("</div>"));
        }
    }
    private void SanPham()
    {
        dlSanPham.DataSource = XLDL.LayDuLieu("select TenSP,GiaBan,GiamGia,TraGop from DIENTHOAI where MaSP='" + Request.QueryString["MaSP"] + "'");
        dlSanPham.DataBind();

    }
    private void KhuyenMai()
    {
        dlKhuyenMai.DataSource = XLDL.LayDuLieu("select NoiDung from KHUYENMAISP where MaSP='" + Request.QueryString["MaSP"] + "'");
        dlKhuyenMai.DataBind();
    }
    private void ThongSo()
    {
        dlThongSo.DataSource = XLDL.LayDuLieu("select * from THONGSOCHITIET where MaSP='" + Request.QueryString["MaSP"] + "'");
        dlThongSo.DataBind();
    }
    private void DanhGia()
    {
        dlDanhGia.DataSource = XLDL.LayDuLieu("select * from DANHGIA where MaSP='" + Request.QueryString["MaSP"] + "'");
        dlDanhGia.DataBind();
    }


    protected void dlSanPham_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        Label lbTraGop = (Label)e.Item.FindControl("lbTraGop");
        Label lbGiamGia = (Label)e.Item.FindControl("lbGiamGia");
        string tragop = lbTraGop.Text.Trim();
        string giamgia = lbGiamGia.Text.Trim();
        if (tragop != "False" && giamgia != "Giảm ₫")
        {
            lbTraGop.Visible = false;
            lbGiamGia.Visible = true;
        }
        else if (tragop != "False" && giamgia == "Giảm ₫")
        {
            lbTraGop.Visible = true;
            lbTraGop.Text = "Trả Góp 0%";
            lbGiamGia.Visible = false;
        }
        else if (tragop == "False" && giamgia != "Giảm ₫")
        {
            lbTraGop.Visible = false;
            lbGiamGia.Visible = true;
        }
        else
        {
            lbTraGop.Visible = false;
            lbGiamGia.Visible = false;
        }
    }

    protected void dlBinhLuan_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        Label lbHinh = (Label)e.Item.FindControl("lbHinh");
        Label lbTen = (Label)e.Item.FindControl("lbTenKH");
        Label lbSL = (Label)e.Item.FindControl("lbSLThich");
        Label lbThich = (Label)e.Item.FindControl("lbThich");
        Label lbDot = (Label)e.Item.FindControl("lbDot");
        Label Label35 = (Label)e.Item.FindControl("Label35");
        Label35.Visible = false;
        LinkButton lThich = (LinkButton)e.Item.FindControl("lThich");
        LinkButton lXoa = (LinkButton)e.Item.FindControl("lXoa");
        string sl = lbSL.Text.Trim();
        if (sl != "")
        {
            string[] b = sl.Split(',');
            if (Session["TenDN"] != null)
            {
                DataTable dt = XLDL.LayDuLieu("select maKH from khachhang where tendn='" + XLDL.MaHoa(Session["TenDN"].ToString()) + "'");
                for (int i = 0; i < b.Length; i++)
                {
                    if (b[i] == dt.Rows[0][0].ToString())
                    {
                        lThich.ForeColor = System.Drawing.Color.Blue;
                        lThich.Font.Bold = true;
                        break;
                    }
                }
                lThich.Visible = true;
                lbThich.Visible = false;
            }
            else
            {
                lThich.Visible = false;
                lbThich.Visible = true;
            }
            lbSL.Text = "(" + b.Length.ToString() + ")";
        }
        else
            lbThich.Visible = false;
        if (Session["TenDN"] != null)
        {
            DataTable dt = XLDL.LayDuLieu("select maKH from khachhang where tendn='" + XLDL.MaHoa(Session["TenDN"].ToString()) + "'");
            int id = int.Parse(dlBinhLuan.DataKeys[e.Item.ItemIndex].ToString());
            int makh = int.Parse(XLDL.LayDuLieu("select makh from binhluan where id=" + id).Rows[0][0].ToString());
            if (int.Parse(dt.Rows[0][0].ToString()) == makh)
            {
                lXoa.Visible = true;
                lbDot.Visible = true;
            }
            else
            {
                lXoa.Visible = false;
                lbDot.Visible = false;
            }
        }
        else
        {
            lXoa.Visible = false;
            lbDot.Visible = false;
        }
        string str = lbTen.Text;
        string[] a = str.Split(' ');
        lbHinh.Text = a[a.Length - 1].Substring(0, 1);
    }

    protected void btnGui_Click(object sender, EventArgs e)
    {
        if (taBinhLuan.Text.Trim() != "")
        {
            string tendn = XLDL.MaHoa(Session["TenDN"].ToString());
            DataTable dt = XLDL.LayDuLieu("select * from khachhang where TenDN='" + tendn + "'");
            if (dt.Rows.Count > 0)
            {
                int makh = int.Parse(dt.Rows[0][0].ToString());
                try
                {
                    SqlConnection con = new SqlConnection(XLDL.strcon);
                    SqlCommand cmd = new SqlCommand("insert into binhluan(masp,makh,binhluan,thoigian) values('" + Request.QueryString["MaSP"] + "'," + makh + ",N'" + taBinhLuan.Text.Trim() + "',@thoigian)", con);
                    cmd.Parameters.Add("@thoigian", SqlDbType.DateTime);
                    cmd.Parameters["@thoigian"].Value = DateTime.Now;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                catch { }
                taBinhLuan.Text = "";
                binhluan();
                slbl();
                CreateBanner();
            }
        }
        else
        {
            taBinhLuan.Text = "";
            CreateBanner();
        }
    }

    protected void dlBinhLuan_ItemCommand(object source, DataListCommandEventArgs e)
    {
        Label Label35 = (Label)e.Item.FindControl("Label35");
        LinkButton lThich = (LinkButton)e.Item.FindControl("lThich");
        string sl = Label35.Text.Trim();
        if (e.CommandName == "Thich")
        {
            string chuoi;
            if (Session["TenDN"] != null)
            {
                DataTable dt = XLDL.LayDuLieu("select maKH from khachhang where tendn='" + XLDL.MaHoa(Session["TenDN"].ToString()) + "'");
                string[] a = sl.Split(',');
                if (sl.Contains(dt.Rows[0][0].ToString()) == false)
                    chuoi = dt.Rows[0][0].ToString();
                else
                    chuoi = "";
                if (a.Length > 1)
                    for (int i = 0; i < a.Length; i++)
                    {
                        if (a[i] == dt.Rows[0][0].ToString()) continue;
                        if (chuoi == "")
                        {
                            chuoi = a[i];
                            continue;
                        }
                        chuoi = chuoi + "," + a[i];
                    }
                else
                {
                    if (a[0] != "")
                        if (chuoi != "")
                            chuoi = chuoi + "," + a[0];
                        else
                            chuoi = "";
                }
                XLDL.Chaylenh("update binhluan set thich='" + chuoi + "' where ID=" + (int)dlBinhLuan.DataKeys[e.Item.ItemIndex]);
            }
            binhluan();
            CreateBanner();
        }
    }

    protected void dlBinhLuan_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        int id = int.Parse(dlBinhLuan.DataKeys[e.Item.ItemIndex].ToString());
        try
        {
            XLDL.Chaylenh("delete from binhluan where id=" + id);
            binhluan();
            slbl();
            CreateBanner();
        }
        catch
        {
            Response.Write("<script>alert('Không thể xóa bình luận')</script>");
        }
    }
}