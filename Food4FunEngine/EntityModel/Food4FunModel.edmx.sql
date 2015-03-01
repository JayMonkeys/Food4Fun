
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/01/2015 23:22:34
-- Generated from EDMX file: C:\Users\Kim Jan Andersen\Desktop\Food4Fun\Food4FunEngine\EntityModel\Food4FunModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Food4Fun];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_PictureMenu]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PictureSet] DROP CONSTRAINT [FK_PictureMenu];
GO
IF OBJECT_ID(N'[dbo].[FK_PictureDish]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PictureSet] DROP CONSTRAINT [FK_PictureDish];
GO
IF OBJECT_ID(N'[dbo].[FK_PictureIngredient]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PictureSet] DROP CONSTRAINT [FK_PictureIngredient];
GO
IF OBJECT_ID(N'[dbo].[FK_MenuDish_Menu]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MenuDish] DROP CONSTRAINT [FK_MenuDish_Menu];
GO
IF OBJECT_ID(N'[dbo].[FK_MenuDish_Dish]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MenuDish] DROP CONSTRAINT [FK_MenuDish_Dish];
GO
IF OBJECT_ID(N'[dbo].[FK_DishRecipe_Dish]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DishRecipe] DROP CONSTRAINT [FK_DishRecipe_Dish];
GO
IF OBJECT_ID(N'[dbo].[FK_DishRecipe_Recipe]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DishRecipe] DROP CONSTRAINT [FK_DishRecipe_Recipe];
GO
IF OBJECT_ID(N'[dbo].[FK_CountryRecipe]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RecipeSet] DROP CONSTRAINT [FK_CountryRecipe];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[DishSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DishSet];
GO
IF OBJECT_ID(N'[dbo].[MenuSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MenuSet];
GO
IF OBJECT_ID(N'[dbo].[PictureSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PictureSet];
GO
IF OBJECT_ID(N'[dbo].[RecipeSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RecipeSet];
GO
IF OBJECT_ID(N'[dbo].[CountrySet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CountrySet];
GO
IF OBJECT_ID(N'[dbo].[IngredientSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[IngredientSet];
GO
IF OBJECT_ID(N'[dbo].[MenuDish]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MenuDish];
GO
IF OBJECT_ID(N'[dbo].[DishRecipe]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DishRecipe];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'DishSet'
CREATE TABLE [dbo].[DishSet] (
    [DishID] uniqueidentifier  NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'MenuSet'
CREATE TABLE [dbo].[MenuSet] (
    [MenuID] uniqueidentifier  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [MenuDescription] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'PictureSet'
CREATE TABLE [dbo].[PictureSet] (
    [PictureID] uniqueidentifier  NOT NULL,
    [PictureUrl] nvarchar(max)  NOT NULL,
    [PictureComment] nvarchar(max)  NOT NULL,
    [Menu_MenuID] uniqueidentifier  NULL,
    [Dish_DishID] uniqueidentifier  NULL,
    [Ingredient_IngredientID] uniqueidentifier  NULL
);
GO

-- Creating table 'RecipeSet'
CREATE TABLE [dbo].[RecipeSet] (
    [RecipeID] uniqueidentifier  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [WorkDescription] nvarchar(max)  NOT NULL,
    [PrepTime] time  NOT NULL,
    [Country_CountryID] uniqueidentifier  NULL
);
GO

-- Creating table 'CountrySet'
CREATE TABLE [dbo].[CountrySet] (
    [CountryID] uniqueidentifier  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [ShortName] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'IngredientSet'
CREATE TABLE [dbo].[IngredientSet] (
    [IngredientID] uniqueidentifier  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [FatPr100] decimal(18,0)  NOT NULL,
    [CarbsPr100] decimal(18,0)  NOT NULL,
    [ProteinPr100] decimal(18,0)  NOT NULL,
    [MessureUnit] int  NOT NULL
);
GO

-- Creating table 'IngredientSet_AmountOf'
CREATE TABLE [dbo].[IngredientSet_AmountOf] (
    [Amount] int IDENTITY(1,1) NOT NULL,
    [IngredientID] uniqueidentifier  NOT NULL,
    [Recipe_RecipeID] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'MenuDish'
CREATE TABLE [dbo].[MenuDish] (
    [Menues_MenuID] uniqueidentifier  NOT NULL,
    [Dishes_DishID] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'DishRecipe'
CREATE TABLE [dbo].[DishRecipe] (
    [Dishes_DishID] uniqueidentifier  NOT NULL,
    [Recipes_RecipeID] uniqueidentifier  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [DishID] in table 'DishSet'
ALTER TABLE [dbo].[DishSet]
ADD CONSTRAINT [PK_DishSet]
    PRIMARY KEY CLUSTERED ([DishID] ASC);
GO

-- Creating primary key on [MenuID] in table 'MenuSet'
ALTER TABLE [dbo].[MenuSet]
ADD CONSTRAINT [PK_MenuSet]
    PRIMARY KEY CLUSTERED ([MenuID] ASC);
GO

-- Creating primary key on [PictureID] in table 'PictureSet'
ALTER TABLE [dbo].[PictureSet]
ADD CONSTRAINT [PK_PictureSet]
    PRIMARY KEY CLUSTERED ([PictureID] ASC);
GO

-- Creating primary key on [RecipeID] in table 'RecipeSet'
ALTER TABLE [dbo].[RecipeSet]
ADD CONSTRAINT [PK_RecipeSet]
    PRIMARY KEY CLUSTERED ([RecipeID] ASC);
GO

-- Creating primary key on [CountryID] in table 'CountrySet'
ALTER TABLE [dbo].[CountrySet]
ADD CONSTRAINT [PK_CountrySet]
    PRIMARY KEY CLUSTERED ([CountryID] ASC);
GO

-- Creating primary key on [IngredientID] in table 'IngredientSet'
ALTER TABLE [dbo].[IngredientSet]
ADD CONSTRAINT [PK_IngredientSet]
    PRIMARY KEY CLUSTERED ([IngredientID] ASC);
GO

-- Creating primary key on [IngredientID] in table 'IngredientSet_AmountOf'
ALTER TABLE [dbo].[IngredientSet_AmountOf]
ADD CONSTRAINT [PK_IngredientSet_AmountOf]
    PRIMARY KEY CLUSTERED ([IngredientID] ASC);
GO

-- Creating primary key on [Menues_MenuID], [Dishes_DishID] in table 'MenuDish'
ALTER TABLE [dbo].[MenuDish]
ADD CONSTRAINT [PK_MenuDish]
    PRIMARY KEY CLUSTERED ([Menues_MenuID], [Dishes_DishID] ASC);
GO

-- Creating primary key on [Dishes_DishID], [Recipes_RecipeID] in table 'DishRecipe'
ALTER TABLE [dbo].[DishRecipe]
ADD CONSTRAINT [PK_DishRecipe]
    PRIMARY KEY CLUSTERED ([Dishes_DishID], [Recipes_RecipeID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Menu_MenuID] in table 'PictureSet'
ALTER TABLE [dbo].[PictureSet]
ADD CONSTRAINT [FK_PictureMenu]
    FOREIGN KEY ([Menu_MenuID])
    REFERENCES [dbo].[MenuSet]
        ([MenuID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PictureMenu'
CREATE INDEX [IX_FK_PictureMenu]
ON [dbo].[PictureSet]
    ([Menu_MenuID]);
GO

-- Creating foreign key on [Dish_DishID] in table 'PictureSet'
ALTER TABLE [dbo].[PictureSet]
ADD CONSTRAINT [FK_PictureDish]
    FOREIGN KEY ([Dish_DishID])
    REFERENCES [dbo].[DishSet]
        ([DishID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PictureDish'
CREATE INDEX [IX_FK_PictureDish]
ON [dbo].[PictureSet]
    ([Dish_DishID]);
GO

-- Creating foreign key on [Ingredient_IngredientID] in table 'PictureSet'
ALTER TABLE [dbo].[PictureSet]
ADD CONSTRAINT [FK_PictureIngredient]
    FOREIGN KEY ([Ingredient_IngredientID])
    REFERENCES [dbo].[IngredientSet]
        ([IngredientID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PictureIngredient'
CREATE INDEX [IX_FK_PictureIngredient]
ON [dbo].[PictureSet]
    ([Ingredient_IngredientID]);
GO

-- Creating foreign key on [Menues_MenuID] in table 'MenuDish'
ALTER TABLE [dbo].[MenuDish]
ADD CONSTRAINT [FK_MenuDish_Menu]
    FOREIGN KEY ([Menues_MenuID])
    REFERENCES [dbo].[MenuSet]
        ([MenuID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Dishes_DishID] in table 'MenuDish'
ALTER TABLE [dbo].[MenuDish]
ADD CONSTRAINT [FK_MenuDish_Dish]
    FOREIGN KEY ([Dishes_DishID])
    REFERENCES [dbo].[DishSet]
        ([DishID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MenuDish_Dish'
CREATE INDEX [IX_FK_MenuDish_Dish]
ON [dbo].[MenuDish]
    ([Dishes_DishID]);
GO

-- Creating foreign key on [Dishes_DishID] in table 'DishRecipe'
ALTER TABLE [dbo].[DishRecipe]
ADD CONSTRAINT [FK_DishRecipe_Dish]
    FOREIGN KEY ([Dishes_DishID])
    REFERENCES [dbo].[DishSet]
        ([DishID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Recipes_RecipeID] in table 'DishRecipe'
ALTER TABLE [dbo].[DishRecipe]
ADD CONSTRAINT [FK_DishRecipe_Recipe]
    FOREIGN KEY ([Recipes_RecipeID])
    REFERENCES [dbo].[RecipeSet]
        ([RecipeID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DishRecipe_Recipe'
CREATE INDEX [IX_FK_DishRecipe_Recipe]
ON [dbo].[DishRecipe]
    ([Recipes_RecipeID]);
GO

-- Creating foreign key on [Country_CountryID] in table 'RecipeSet'
ALTER TABLE [dbo].[RecipeSet]
ADD CONSTRAINT [FK_CountryRecipe]
    FOREIGN KEY ([Country_CountryID])
    REFERENCES [dbo].[CountrySet]
        ([CountryID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CountryRecipe'
CREATE INDEX [IX_FK_CountryRecipe]
ON [dbo].[RecipeSet]
    ([Country_CountryID]);
GO

-- Creating foreign key on [Recipe_RecipeID] in table 'IngredientSet_AmountOf'
ALTER TABLE [dbo].[IngredientSet_AmountOf]
ADD CONSTRAINT [FK_RecipeAmountOf]
    FOREIGN KEY ([Recipe_RecipeID])
    REFERENCES [dbo].[RecipeSet]
        ([RecipeID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RecipeAmountOf'
CREATE INDEX [IX_FK_RecipeAmountOf]
ON [dbo].[IngredientSet_AmountOf]
    ([Recipe_RecipeID]);
GO

-- Creating foreign key on [IngredientID] in table 'IngredientSet_AmountOf'
ALTER TABLE [dbo].[IngredientSet_AmountOf]
ADD CONSTRAINT [FK_AmountOf_inherits_Ingredient]
    FOREIGN KEY ([IngredientID])
    REFERENCES [dbo].[IngredientSet]
        ([IngredientID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------