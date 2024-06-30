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
    public partial class Form2 : Form
    {
        public Form2(string s)
        {
            InitializeComponent();
            textBox1.Text = s;
        }

        private void Form2_Load(object sender, EventArgs e)
        {

        }
    }
}
