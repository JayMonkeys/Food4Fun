//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Food4FunEngine.EntityModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class Dish
    {
        public Dish()
        {
            this.Pictures = new HashSet<Picture>();
            this.Menues = new HashSet<Menu>();
            this.Recipes = new HashSet<Recipe>();
        }
    
        public System.Guid DishID { get; private set; }
        public string Name { get; set; }
    
        public virtual ICollection<Picture> Pictures { get; set; }
        public virtual ICollection<Menu> Menues { get; set; }
        public virtual ICollection<Recipe> Recipes { get; set; }
    }
}