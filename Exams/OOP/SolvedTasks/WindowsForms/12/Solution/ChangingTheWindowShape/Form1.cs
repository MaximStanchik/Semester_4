using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ChangingTheWindowShape
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            this.MouseDown += Form1_MouseDown;
            this.MouseUp += Form1_MouseUp;
        }
        private void Form1_MouseDown(object sender, MouseEventArgs e)
        {

            this.Size = new Size(this.Width + 100, this.Height + 100);
        }

        private void Form1_MouseUp(object sender, MouseEventArgs e)
        {
            this.Size = new Size(Width - 100, Height - 100);
        }

    }
}
