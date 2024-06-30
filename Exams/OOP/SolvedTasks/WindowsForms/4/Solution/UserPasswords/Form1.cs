using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace UserPasswords
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            textBox3.ReadOnly = true;  // Установка свойства ReadOnly в true
            textBox3.Height = 500;
        }
        private void button1_Click(object sender, EventArgs e)
        {
            string userPassword = textBox1.Text;
            string repeatUserPassword = textBox2.Text;

            if (userPassword != repeatUserPassword)
            {
                MessageBox.Show("Пароли не совпадают");
            }
            else if (userPassword.Length > 12)
            {
                MessageBox.Show("Пароль содержит больше 12 символов");
            }
            else if (userPassword.Length < 6)
            {
                MessageBox.Show("Пароль содержит меньше 6 символов");
            }
            else if (checkingCharactersInPassword(userPassword) == false)
            {
                MessageBox.Show("Пароль не содержит в себе цифры или буквы");
            }
            else
            {
                MessageBox.Show("Все ОК");
            }
        }
        private Boolean checkingCharactersInPassword(string Password)
        {
            Boolean presenceOfNumbersInThePassword = false;
            Boolean presenceOfLettersInThePassword = false;
            for (int i = 0; i < Password.Length; i ++)
            {
                if (char.IsDigit(Password[i]))
                {
                    presenceOfNumbersInThePassword = true;
                }
                else if (char.IsLetter(Password[i]))
                {
                    presenceOfLettersInThePassword = true;
                }
            }

            if (presenceOfNumbersInThePassword == true && presenceOfLettersInThePassword == true)
            {
                return true;
            }
            else
            {
                return false;
            }
        }


        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }





        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        
    }
}
