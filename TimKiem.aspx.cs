using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class TimKiem : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            aTimKiem();
            kqtk.Controls.Add(new LiteralControl("Kết quả tìm kiếm \"" + XLDL.Timkiem + "\""));
        }      
    }
    private void aTimKiem()
    {
        DataTable dt = XLDL.LayDuLieu("select * from DIENTHOAI where TenSP like N'%" + XLDL.Timkiem + "%'");
        if(dt.Rows.Count>0)
        {
            dlTimKiem.DataSource = XLDL.LayDuLieu("select * from DIENTHOAI where TenSP like N'%" + XLDL.Timkiem + "%'");
            dlTimKiem.DataBind();
            kq.Controls.Add(new LiteralControl("Kết quả tìm kiếm cho từ khóa \"<span style=\"color:#F00\">" + XLDL.Timkiem + "</span>\""));
            lbThongBao.Visible = false;
        }
        else
        {
            kq.Controls.Add(new LiteralControl("Không tìm thấy kết quả nào phù hợp cho từ khóa \"<span style=\"color:#F00\">" + XLDL.Timkiem + "</span>\""));
            lbThongBao.Controls.Add(new LiteralControl("<div style=\"padding-left: 20px\">"));
            lbThongBao.Controls.Add(new LiteralControl("<div>Để tìm được kết quả chính xác hơn, bạn vui lòng:</div>"));
            lbThongBao.Controls.Add(new LiteralControl("<ul style=\"font-size: 13px; padding-left: 20px\">"));
            lbThongBao.Controls.Add(new LiteralControl("<li>Kiểm tra lỗi chính tả của từ khóa đã nhập</li>"));
            lbThongBao.Controls.Add(new LiteralControl("<li>Thử lại bằng từ khóa khác</li>"));
            lbThongBao.Controls.Add(new LiteralControl("<li>Thử lại bằng những từ khóa tổng quát hơn</li>"));
            lbThongBao.Controls.Add(new LiteralControl("<li>Thử lại bằng những từ khóa ngắn gọn hơn</li>"));
            lbThongBao.Controls.Add(new LiteralControl("</ul>"));
            lbThongBao.Controls.Add(new LiteralControl("</div>"));
        }  
    }

    protected void dlTimKiem_ItemDataBound(object sender, DataListItemEventArgs e)
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

        Label lbGiaban = (Label)e.Item.FindControl("lbGiaBan");
        if (lbGiaban.Text.Trim() != "")
        {
            double gia = Convert.ToDouble(lbGiaban.Text.Trim());
            lbGiaban.Text = String.Format("{0:#,#₫}", gia);
        }
        else
        {
            lbGiaban.Text = "Mới ra mắt";
        }
    }
}