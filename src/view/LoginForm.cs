using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WeatherApp.src.view
{
    public partial class LoginForm : Form
    {
        public LoginForm()
        {
            InitializeComponent();
        }

        private void Логин_Click(object sender, EventArgs e)
        {

        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            string login = txtLogin.Text;
            string password = txtPassword.Text;

            // Проверяем (пока для теста: логин admin, пароль 123)
            if (login == "admin" && password == "123")
            {
                MessageBox.Show("Успешный вход!");

                // Прячем форму авторизации
                this.Hide();

                // Открываем главную форму с таблицей
                Form1 mainForm = new Form1();
                mainForm.ShowDialog();

                // Когда закроют главную форму, закрываем приложение
                this.Close();
            }
            else
            {
                MessageBox.Show("Неверный логин или пароль!", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
