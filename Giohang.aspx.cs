using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Giohang : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["MaSP"] != null)
            {
                string MaSP = Request.QueryString["MaSP"].ToString();
                DataTable dt = XLDL.LayDuLieu("select tensp,giaban,hinhanh,giamgia from dienthoai where masp='" + MaSP + "'");
                string TenSP = dt.Rows[0][0].ToString();
                double GiaBan = double.Parse(dt.Rows[0][1].ToString());
                string HinhAnh = dt.Rows[0][2].ToString();
                double GiamGia;
                if (dt.Rows[0][3].ToString() != "")
                    GiamGia = double.Parse(dt.Rows[0][3].ToString());
                else
                    GiamGia = 0;
                int SoLuong = 1;
                ThemVaoGioHang(HinhAnh, TenSP, SoLuong, GiaBan, GiamGia);
                Response.Redirect("~/giohang.aspx");
            }
            if (Session["Giohang"] != null)
            {
                DataTable dt = (DataTable)Session["Giohang"];
                System.Decimal tongcong = 0;
                foreach (DataRow r in dt.Rows)
                {
                    r["ThanhTien"] = Convert.ToInt32(r["SoLuong"]) * (Convert.ToDecimal(r["GiaBan"]) - Convert.ToDecimal(r["GiamGia"]));
                    tongcong += Convert.ToDecimal(r["ThanhTien"]);
                    lbTongCong.Text = "Tổng cộng:  " + String.Format("{0:#,#₫}", tongcong);
                }
                gvGiohang.DataSource = dt;
                gvGiohang.DataBind();
                imgEmpty.Visible = false;
                hpThanhToan.Visible = true;
            }
            else
            {
                imgEmpty.Visible = true;
                hpThanhToan.Visible = false;
                dTien.Visible = false;
            }
        }
    }
    public void ThemVaoGioHang(string HinhAnh, string TenSP, int SoLuong, double GiaBan, double GiamGia)
    {
        DataTable dt;
        if (Session["Giohang"] == null)
        {
            dt = new DataTable();
            dt.Columns.Add("HinhAnh");
            dt.Columns.Add("TenSP");
            dt.Columns.Add("SoLuong");
            dt.Columns.Add("GiaBan");
            dt.Columns.Add("GiamGia");
            dt.Columns.Add("ThanhTien");
        }
        else
            dt = (DataTable)Session["Giohang"];
        int dong = SPDaCoTrongGioHang(TenSP, dt);
        if (dong != -1)
        {
            if (Convert.ToInt32(dt.Rows[dong]["SoLuong"]) < 5)
                dt.Rows[dong]["SoLuong"] = Convert.ToInt32(dt.Rows[dong]["SoLuong"]) + SoLuong;
        }
        else
        {
            DataRow dr = dt.NewRow();
            dr["HinhAnh"] = HinhAnh;
            dr["TenSP"] = TenSP;
            dr["SoLuong"] = SoLuong;
            dr["GiaBan"] = GiaBan;
            dr["GiamGia"] = GiamGia;
            dr["ThanhTien"] = GiaBan * SoLuong;
            dt.Rows.Add(dr);
        }
        Session["Giohang"] = dt;
    }

    public int SPDaCoTrongGioHang(string TenSP, DataTable dt)
    {
        int dong = -1;
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            if (dt.Rows[i]["TenSP"].ToString() == TenSP)
            {
                dong = i;
                break;
            }
        }
        return dong;
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataTable dt = (DataTable)Session["Giohang"];
        foreach (GridViewRow r in gvGiohang.Rows)
        {
            foreach (DataRow dr in dt.Rows)
                if (Convert.ToString(gvGiohang.DataKeys[r.DataItemIndex].Value) == dr["TenSP"].ToString())
                {
                    DropDownList t = (DropDownList)r.Cells[2].FindControl("dlSoLuong");
                    dr["SoLuong"] = t.SelectedItem;
                    break;
                }
        }
        Session["Giohang"] = dt;
        Response.Redirect("~/giohang.aspx");
    }

    protected void gvGiohang_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Xoa")
        {
            int chiso = int.Parse(e.CommandArgument.ToString());
            try
            {
                DataTable dt = (DataTable)Session["Giohang"];
                dt.Rows.RemoveAt(chiso);
                if (dt.Rows.Count > 0)
                    Session["Giohang"] = dt;
                else
                    Session["Giohang"] = null;
                Response.Redirect("~/giohang.aspx");
            }
            catch
            {
                Response.Redirect("~/giohang.aspx");
            }
        }
    }

    protected void hpThanhToan_Click(object sender, EventArgs e)
    {
        if (Session["TenDN"] != null)
            Response.Redirect("~/muahang.aspx");
        else
        {
            Session["GHtoDN"] = true;
            Response.Redirect("~/dangnhap.aspx");
        }
            
    }
}