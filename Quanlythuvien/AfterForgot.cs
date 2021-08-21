﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Threading;

namespace Quanlythuvien
{
    public partial class AfterForgot : Form
    {
        Thread th;
        bool check = false;
        int ticks = 5;
        string getid;
        string connection = Properties.Settings.Default.connection;
        Models.TaiKhoan modelTaiKhoan = new Models.TaiKhoan();
        Controllers.TaiKhoan ctrlTaiKhoan = new Controllers.TaiKhoan();
        public AfterForgot(string id)
        {
            InitializeComponent();
            getid = id;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (Validate())
            {
                // Sql
                SqlConnection con = new SqlConnection(connection);
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT MatKhau, TenTaiKhoan, PhanQuyen, Email, TenNguoiDung FROM TaiKhoan WHERE MaTT = N'" + getid + "'", con);
                SqlDataReader da = cmd.ExecuteReader();
                if (da.Read())
                {
                    string username = da.GetValue(1).ToString();
                    string usertype = da.GetValue(2).ToString();
                    string email = da.GetValue(3).ToString();
                    string name = da.GetValue(4).ToString();
                    string password = tbxNewPassword.Text;
                    modelTaiKhoan.MaTT = getid;
                    modelTaiKhoan.MatKhau = password;
                    modelTaiKhoan.PhanQuyen = usertype;
                    modelTaiKhoan.Email = email;
                    modelTaiKhoan.TenNguoiDung = name;
                    modelTaiKhoan.TenTaiKhoan = username;
                    ctrlTaiKhoan.Update(modelTaiKhoan);

                    tbxResult.BackColor = Color.FromArgb(204, 255, 204);
                    tbxResult.ForeColor = Color.Green;
                    tbxResult.Text = "     Chúc mừng bạn đã đổi mật khẩu thành công!, chuyển hướng đến trang đăng nhập sau 5s ...";
                    tbxResult.Visible = true;
                    check = true;

                }
            }
        }

        private void AfterForgot_Load(object sender, EventArgs e)
        {
            // Sql
            SqlConnection con = new SqlConnection(connection);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT TenTaiKhoan FROM TaiKhoan WHERE MaTT = N'" + getid + "'", con);
            SqlDataReader da = cmd.ExecuteReader();
            if (da.Read())
                lbUsername.Text = da.GetValue(0).ToString();
            else
                con.Close();
            tbxResult.Visible = false;
        }
        bool Validate()
        {
            lbNew.Text = "";
            lbCF.Text = "";
            tbxResult.Visible = false;

             if (string.IsNullOrEmpty(tbxNewPassword.Text))
            {
                lbNew.ForeColor = Color.Red;
                lbNew.Text = "Vui lòng nhập mật khẩu mới của bạn!";
                tbxNewPassword.Focus();
                return false;
            }
            else if (string.IsNullOrEmpty(tbxCFPassword.Text))
            {
                lbCF.ForeColor = Color.Red;
                lbCF.Text = "Vui lòng nhập mật khẩu xác nhận!";
                tbxCFPassword.Focus();
                return false;
            }
            else if (tbxNewPassword.Text != tbxCFPassword.Text)
            {
                lbCF.ForeColor = Color.Red;
                lbCF.Text = "Mật khẩu không khớp!";
                tbxCFPassword.Focus();
                return false;
            }
            else
                return true;
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            if (check)
            {
                ticks--;
                tbxResult.Text = "     Chúc mừng bạn đã đổi mật khẩu thành công!, chuyển hướng đến trang đăng nhập sau " + ticks + "s ...";
                if (ticks == 0)
                {
                    this.Close();
                    th = new Thread(OpennewLogin);
                    th.SetApartmentState(ApartmentState.STA);
                    th.Start();
                }
            }

        }
        void OpennewLogin()
        {
            Application.Run(new Login());
        }
    }
}
