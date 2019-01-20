using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MuaHang : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if (Session["TenDN"] == null)
                Response.Redirect("~/DangNhap.aspx");
            if (Session["GioHang"] != null)
            {
                DataTable dt = (DataTable)Session["Giohang"];
                System.Decimal tongcong = 0;
                foreach (DataRow r in dt.Rows)
                {
                    tongcong += Convert.ToDecimal(r["ThanhTien"]);
                    lbTongCong.Text = "Tổng cộng: " + String.Format("{0:#,#₫}", tongcong);
                }
                gvGioHang.DataSource = dt;
                gvGioHang.DataBind();
            }
            else
                Response.Redirect("~/index.aspx");
            thongtin();
        }
    }
    private void thongtin()
    {
        if(Session["TenDN"]!=null)
        {
            DataTable dt = XLDL.LayDuLieu("select hoten, diachi, dienthoai, email from khachhang where tendn='" + XLDL.MaHoa(Session["TenDN"].ToString()) + "'");
            if(dt.Rows.Count>0)
            {
                txtTen.Text = dt.Rows[0][0].ToString();
                txtDiaChi.Text = dt.Rows[0][1].ToString();
                txtSDT.Text = dt.Rows[0][2].ToString();
                txtEmail.Text = dt.Rows[0][3].ToString();
            }
        }
    }
    public int thanhtoan = 0;
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if (Session["TenDN"] != null)
        {
            thanhtoan = 0;
            LuuThanhToan();
            guiMail();
            Session["MHtoTC"] = true;
            Session["Giohang"] = null;
            Response.Redirect("~/ThanhCong.aspx");
        }  
    }
    public string mota = "";
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        if (Session["TenDN"] != null)
        {
            BaoKimPayment bk = new BaoKimPayment();
            thanhtoan = 1;
            LuuThanhToan();
            string sodh = XLDL.LayDuLieu("select max(sodh) from donhang where makh=" + XLDL.LayDuLieu("select makh from khachhang where tendn='" + XLDL.MaHoa(Session["TenDN"].ToString()) + "'").Rows[0][0]).Rows[0][0].ToString();
            string str = lbTongCong.Text;
            string[] a = str.Split(' ');
            double thanhtien = Convert.ToDouble(a[2].Substring(0,a[2].Length-1));
            string chuoibk = bk.createRequestUrl(sodh, SessionKey.Business,Convert.ToString(thanhtien),"0","0",mota, "http://nguyenhoang.ga/thanhcong.aspx", "http://nguyenhoang.ga/thanhcong.aspx","");
            Session["MHtoTC"] = true;
            Session["Giohang"] = null;            
            Response.Redirect(chuoibk);
        }
    }
    protected void LuuThanhToan()
    {
        try
        {
            int makh = int.Parse(XLDL.LayDuLieu("select makh from khachhang where tendn='" + XLDL.MaHoa(Session["TenDN"].ToString()) + "'").Rows[0][0].ToString());
            SqlConnection con = new SqlConnection(XLDL.strcon);
            SqlCommand cmd = new SqlCommand("insert into donhang(makh,ngaydh,tennguoinhan,diachinhan,sdtnhan,thanhtoan) values(" + makh + ",@ngaydh,N'" + txtTen.Text.Trim() + "',N'" + txtDiaChi.Text.Trim() + "','" + txtSDT.Text.Trim() + "'," + thanhtoan + ")", con);
            con.Open();
            cmd.Parameters.Add("@ngaydh", SqlDbType.DateTime);
            cmd.Parameters["@ngaydh"].Value = DateTime.Now;
            cmd.ExecuteNonQuery();
            con.Close();
            int sodh = int.Parse(XLDL.LayDuLieu("select max(sodh) from donhang where makh=" + XLDL.LayDuLieu("select makh from khachhang where tendn='" + XLDL.MaHoa(Session["TenDN"].ToString()) + "'").Rows[0][0]).Rows[0][0].ToString());
            DataTable dt = (DataTable)Session["Giohang"];
            string Masp;
            int soluong;
            double dongia, giamgia;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Masp = XLDL.LayDuLieu("select masp from dienthoai where tensp='" + dt.Rows[i]["TenSP"].ToString().Trim() + "'").Rows[0][0].ToString();
                soluong = int.Parse(dt.Rows[i]["SoLuong"].ToString());
                dongia = double.Parse(dt.Rows[i]["GiaBan"].ToString());
                if (dt.Rows[i]["GiamGia"].ToString() != "")
                    giamgia = double.Parse(dt.Rows[i]["GiamGia"].ToString());
                else
                    giamgia = 0;
                if (i == dt.Rows.Count - 1)
                    mota += soluong.ToString() + " x " + dt.Rows[i]["TenSP"].ToString().Trim();
                else
                    mota += soluong.ToString() + "x" + dt.Rows[i]["TenSP"].ToString().Trim() + ", ";
                XLDL.Chaylenh("insert into ctdonhang(sodh,masp,soluong,dongia,giamgia) values(" + sodh + ",'" + Masp + "'," + soluong + "," + dongia + "," + giamgia + ")");
            }
        }
        catch
        {
            Response.Write("<script>alert('Không thể đặt đơn hàng này')</script>");
        }
    }
    private void guiMail()
    {
        SmtpClient smtp = new SmtpClient();
        try
        {
            //ĐỊA CHỈ SMTP Server
            smtp.Host = "smtp.gmail.com";
            //Cổng SMTP
            smtp.Port = 587;
            //SMTP yêu cầu mã hóa dữ liệu theo SSL
            smtp.EnableSsl = true;
            //UserName và Password của mail
            smtp.Credentials = new NetworkCredential("nguyenhoangmb.ga@gmail.com", "NguyenHoang123");
            //Tham số lần lượt là địa chỉ người gửi, người nhận, tiêu đề và nội dung thư
            smtp.Send("nguyenhoangmb.ga@gmail.com", txtEmail.Text.Trim(), "Nguyễn Hoàng Mobile - Thông báo đặt hàng thành công", "Xin chào "+ txtTen.Text.Trim()+ ",\n\nCám ơn bạn đã mua sắm tại Nguyễn Hoàng Mobile.\nChúng tôi rất vui thông báo đơn hàng của quý khách đã được tiếp nhận và đang trong quá trình xử lý. Chúng tôi sẽ thông báo đến quý khách ngay khi hàng chuẩn bị được giao.\nChúc quý khách một ngày tốt lành\n\nTrân trọng!");
        }
        catch
        {
            Response.Write("<script>alert('Lỗi không gửi được email')</script>");
        }
    }
}