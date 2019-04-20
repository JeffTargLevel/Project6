
CREATE TABLE public.Pizzeria (
                id INTEGER NOT NULL,
                CONSTRAINT pizzeria_pk PRIMARY KEY (id)
);


CREATE TABLE public.Ingredient (
                id INTEGER NOT NULL,
                name VARCHAR NOT NULL,
                CONSTRAINT ingredient_pk PRIMARY KEY (id)
);


CREATE TABLE public.Pizzaiolo (
                id INTEGER NOT NULL,
                id_pizzeria INTEGER NOT NULL,
                name VARCHAR NOT NULL,
                password VARCHAR NOT NULL,
                CONSTRAINT pizzaiolo_pk PRIMARY KEY (id)
);


CREATE TABLE public.Manager (
                id INTEGER NOT NULL,
                id_pizzeria INTEGER NOT NULL,
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
                id_pizzeria INTEGER NOT NULL,
                id_ingredient INTEGER NOT NULL,
                quantity DOUBLE PRECISION NOT NULL,
                CONSTRAINT stock_pk PRIMARY KEY (id)
);


CREATE TABLE public.Pizza (
                id INTEGER NOT NULL,
                name VARCHAR NOT NULL,
                description VARCHAR NOT NULL,
                recipe VARCHAR NOT NULL,
                price DOUBLE PRECISION NOT NULL,
                CONSTRAINT pizza_pk PRIMARY KEY (id)
);


CREATE TABLE public.OrderLine (
                id INTEGER NOT NULL,
                quantity DOUBLE PRECISION NOT NULL,
                CONSTRAINT orderline_pk PRIMARY KEY (id)
);


CREATE TABLE public.Basket (
                id INTEGER NOT NULL,
                CONSTRAINT basket_pk PRIMARY KEY (id)
);


CREATE TABLE public.PizzaIngredients (
                id INTEGER NOT NULL,
                id_pizza INTEGER NOT NULL,
                quantity DOUBLE PRECISION NOT NULL,
                CONSTRAINT pizzaingredients_pk PRIMARY KEY (id)
);


CREATE TABLE public.Order (
                id INTEGER NOT NULL,
                id_customer INTEGER NOT NULL,
                number INTEGER NOT NULL,
                timeOrder TIMESTAMP NOT NULL,
                deliveryStatus BOOLEAN NOT NULL,
                status BOOLEAN NOT NULL,
                totalPrice DOUBLE PRECISION NOT NULL,
                CONSTRAINT order_pk PRIMARY KEY (id)
);


ALTER TABLE public.Manager ADD CONSTRAINT pizzeria_manager_fk
FOREIGN KEY (id_pizzeria)
REFERENCES public.Pizzeria (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Pizzaiolo ADD CONSTRAINT pizzeria_pizzaiolo_fk
FOREIGN KEY (id_pizzeria)
REFERENCES public.Pizzeria (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Stock ADD CONSTRAINT pizzeria_stock_fk
FOREIGN KEY (id_pizzeria)
REFERENCES public.Pizzeria (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.PizzaIngredients ADD CONSTRAINT ingredient_pizzaingredients_fk
FOREIGN KEY (id)
REFERENCES public.Ingredient (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Stock ADD CONSTRAINT ingredient_stock_fk
FOREIGN KEY (id_ingredient)
REFERENCES public.Ingredient (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Order ADD CONSTRAINT customer_order_fk
FOREIGN KEY (id_customer)
REFERENCES public.Customer (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.PizzaIngredients ADD CONSTRAINT pizza_pizzaingredients_fk
FOREIGN KEY (id_pizza)
REFERENCES public.Pizza (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.OrderLine ADD CONSTRAINT pizza_orderline_fk
FOREIGN KEY (id)
REFERENCES public.Pizza (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Basket ADD CONSTRAINT orderline_basket_fk
FOREIGN KEY (id)
REFERENCES public.OrderLine (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Order ADD CONSTRAINT basket_order_fk
FOREIGN KEY (id)
REFERENCES public.Basket (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
