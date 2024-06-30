using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace между_формами_данные_гоняем
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        Form2 form2;
        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            form2 = new Form2(textBox1.Text);
            form2.ShowDialog();
        }
    }
}
