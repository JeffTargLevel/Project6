
CREATE TABLE public.Ingredient (
                id INTEGER NOT NULL,
                name VARCHAR NOT NULL,
                CONSTRAINT ingredient_pk PRIMARY KEY (id)
);


CREATE TABLE public.Pizzaiolo (
                id INTEGER NOT NULL,
                name VARCHAR NOT NULL,
                password VARCHAR NOT NULL,
                CONSTRAINT pizzaiolo_pk PRIMARY KEY (id)
);


CREATE TABLE public.Manager (
                id INTEGER NOT NULL,
                name VARCHAR NOT NULL,
                password VARCHAR NOT NULL,
                CONSTRAINT manager_pk PRIMARY KEY (id)
);


CREATE TABLE public.Customer (
                id INTEGER NOT NULL,
                name VARCHAR NOT NULL,
                firstname VARCHAR NOT NULL,
                address VARCHAR NOT NULL,
                mail VARCHAR NOT NULL,
                phoneNumber VARCHAR NOT NULL,
                password VARCHAR NOT NULL,
                CONSTRAINT customer_pk PRIMARY KEY (id)
);


CREATE TABLE public.Stock (
                id INTEGER NOT NULL,
                id_ingredient INTEGER NOT NULL,
                quantity DOUBLE PRECISION NOT NULL,
                CONSTRAINT stock_pk PRIMARY KEY (id)
);


CREATE TABLE public.Pizzeria (
                id INTEGER NOT NULL,
                id_manager INTEGER NOT NULL,
                id_stock INTEGER NOT NULL,
                CONSTRAINT pizzeria_pk PRIMARY KEY (id)
);


CREATE TABLE public.Pizza (
                id INTEGER NOT NULL,
                name VARCHAR NOT NULL,
                description VARCHAR NOT NULL,
                recipe VARCHAR NOT NULL,
                price DOUBLE PRECISION NOT NULL,
                CONSTRAINT pizza_pk PRIMARY KEY (id)
);


CREATE TABLE public.PizzaIngredients (
                id INTEGER NOT NULL,
                id_ingredient INTEGER NOT NULL,
                id_pizza INTEGER NOT NULL,
                CONSTRAINT pizzaingredients_pk PRIMARY KEY (id)
);


CREATE TABLE public.Order (
                id INTEGER NOT NULL,
                id_pizza INTEGER NOT NULL,
                quantity DOUBLE PRECISION NOT NULL,
                CONSTRAINT order_pk PRIMARY KEY (id)
);


CREATE TABLE public.Basket (
                id INTEGER NOT NULL,
                id_order INTEGER NOT NULL,
                CONSTRAINT basket_pk PRIMARY KEY (id)
);


CREATE TABLE public.PizzaOrder (
                id INTEGER NOT NULL,
                id_manager INTEGER NOT NULL,
                id_customer INTEGER NOT NULL,
                id_basket INTEGER NOT NULL,
                number INTEGER NOT NULL,
                timeOrder TIMESTAMP NOT NULL,
                deliveryStatus BOOLEAN NOT NULL,
                status BOOLEAN NOT NULL,
                totalPrice DOUBLE PRECISION NOT NULL,
                CONSTRAINT pizzaorder_pk PRIMARY KEY (id)
);


ALTER TABLE public.Stock ADD CONSTRAINT ingredient_stock_fk
FOREIGN KEY (id_ingredient)
REFERENCES public.Ingredient (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.PizzaIngredients ADD CONSTRAINT ingredient_pizzaingredients_fk
FOREIGN KEY (id_ingredient)
REFERENCES public.Ingredient (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.PizzaOrder ADD CONSTRAINT pizzaiolo_pizzaorder_fk
FOREIGN KEY (id)
REFERENCES public.Pizzaiolo (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Pizzeria ADD CONSTRAINT manager_pizzeria_fk
FOREIGN KEY (id_manager)
REFERENCES public.Manager (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.PizzaOrder ADD CONSTRAINT customer_pizzaorder_fk
FOREIGN KEY (id_customer)
REFERENCES public.Customer (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Pizzeria ADD CONSTRAINT stock_pizzeria_fk
FOREIGN KEY (id_stock)
REFERENCES public.Stock (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Order ADD CONSTRAINT pizza_order_fk
FOREIGN KEY (id_pizza)
REFERENCES public.Pizza (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.PizzaIngredients ADD CONSTRAINT pizza_pizzaingredients_fk
FOREIGN KEY (id_pizza)
REFERENCES public.Pizza (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Basket ADD CONSTRAINT order_basket_fk
FOREIGN KEY (id_order)
REFERENCES public.Order (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.PizzaOrder ADD CONSTRAINT basket_pizzaorder_fk
FOREIGN KEY (id_basket)
REFERENCES public.Basket (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
