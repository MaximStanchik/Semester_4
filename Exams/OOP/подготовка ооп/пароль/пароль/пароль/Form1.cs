using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace пароль
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
           string password = textBox1.Text;
           string confirmpass = textBox2.Text;   
            
            if (password != confirmpass)
            {
                textBox3.Text = "пароли не совпадают";
                return;
            }


            if (password.Length < 6 || password.Length >12)
            {
                textBox3.Text = "неверная длинна пароля";
                return;
            }

            if (!password.Any(char.IsDigit) || !password.Any(char.IsLetter))
            {
                textBox3.Text = "нету букав цифар";
                return;
            }
            textBox3.Text = "норм";
        }
    }
}
