﻿#pragma checksum "..\..\..\EventsTest.xaml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "CA1D4EBF9FFEDE5C37EA44F6F41979AE56F1649F"
//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан программой.
//     Исполняемая версия:4.0.30319.42000
//
//     Изменения в этом файле могут привести к неправильной работе и будут потеряны в случае
//     повторной генерации кода.
// </auto-generated>
//------------------------------------------------------------------------------

using Lab07;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Controls.Ribbon;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace Lab07 {
    
    
    /// <summary>
    /// EventsTest
    /// </summary>
    public partial class EventsTest : System.Windows.Controls.Page, System.Windows.Markup.IComponentConnector {
        
        
        #line 45 "..\..\..\EventsTest.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Label testEventBubble;
        
        #line default
        #line hidden
        
        
        #line 47 "..\..\..\EventsTest.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Label testEventTunnel;
        
        #line default
        #line hidden
        
        
        #line 48 "..\..\..\EventsTest.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Label testEventDirect;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "7.0.12.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/Lab07;component/eventstest.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\EventsTest.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "7.0.12.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            
            #line 22 "..\..\..\EventsTest.xaml"
            ((System.Windows.Controls.StackPanel)(target)).GotMouseCapture += new System.Windows.Input.MouseEventHandler(this.Rectangle_GotMouseCapture);
            
            #line default
            #line hidden
            return;
            case 2:
            
            #line 23 "..\..\..\EventsTest.xaml"
            ((System.Windows.Controls.Button)(target)).GotMouseCapture += new System.Windows.Input.MouseEventHandler(this.Rectangle_GotMouseCapture);
            
            #line default
            #line hidden
            return;
            case 3:
            
            #line 24 "..\..\..\EventsTest.xaml"
            ((System.Windows.Shapes.Rectangle)(target)).GotMouseCapture += new System.Windows.Input.MouseEventHandler(this.Rectangle_GotMouseCapture);
            
            #line default
            #line hidden
            return;
            case 4:
            
            #line 30 "..\..\..\EventsTest.xaml"
            ((System.Windows.Controls.StackPanel)(target)).PreviewMouseDown += new System.Windows.Input.MouseButtonEventHandler(this.Button_PreviewMouseDown);
            
            #line default
            #line hidden
            return;
            case 5:
            
            #line 31 "..\..\..\EventsTest.xaml"
            ((System.Windows.Controls.Button)(target)).PreviewMouseDown += new System.Windows.Input.MouseButtonEventHandler(this.Button_PreviewMouseDown);
            
            #line default
            #line hidden
            return;
            case 6:
            
            #line 32 "..\..\..\EventsTest.xaml"
            ((System.Windows.Shapes.Rectangle)(target)).PreviewMouseDown += new System.Windows.Input.MouseButtonEventHandler(this.Button_PreviewMouseDown);
            
            #line default
            #line hidden
            return;
            case 7:
            
            #line 38 "..\..\..\EventsTest.xaml"
            ((System.Windows.Controls.StackPanel)(target)).MouseDown += new System.Windows.Input.MouseButtonEventHandler(this.Button_MouseDown);
            
            #line default
            #line hidden
            return;
            case 8:
            
            #line 39 "..\..\..\EventsTest.xaml"
            ((System.Windows.Controls.Button)(target)).MouseDown += new System.Windows.Input.MouseButtonEventHandler(this.Button_MouseDown);
            
            #line default
            #line hidden
            return;
            case 9:
            
            #line 40 "..\..\..\EventsTest.xaml"
            ((System.Windows.Shapes.Rectangle)(target)).MouseDown += new System.Windows.Input.MouseButtonEventHandler(this.Button_MouseDown);
            
            #line default
            #line hidden
            return;
            case 10:
            this.testEventBubble = ((System.Windows.Controls.Label)(target));
            return;
            case 11:
            this.testEventTunnel = ((System.Windows.Controls.Label)(target));
            return;
            case 12:
            this.testEventDirect = ((System.Windows.Controls.Label)(target));
            return;
            }
            this._contentLoaded = true;
        }
    }
}

