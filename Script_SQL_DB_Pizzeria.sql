
CREATE TABLE public.Pizzaiolo (
                id INTEGER NOT NULL,
                CONSTRAINT pizzaiolo_pk PRIMARY KEY (id)
);


CREATE TABLE public.Manager (
                id INTEGER NOT NULL,
                CONSTRAINT manager_pk PRIMARY KEY (id)
);


CREATE TABLE public.Employee (
                id INTEGER NOT NULL,
                name VARCHAR NOT NULL,
                password VARCHAR NOT NULL,
                CONSTRAINT employee_pk PRIMARY KEY (id)
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


CREATE TABLE public.Pizza (
                id INTEGER NOT NULL,
                name VARCHAR NOT NULL,
                description VARCHAR NOT NULL,
                recipe VARCHAR NOT NULL,
                ingredients VARCHAR NOT NULL,
                quantityIngredients DOUBLE PRECISION NOT NULL,
                price DOUBLE PRECISION NOT NULL,
                CONSTRAINT pizza_pk PRIMARY KEY (id)
);


CREATE TABLE public.Stock (
                id INTEGER NOT NULL,
                ingredients VARCHAR NOT NULL,
                quantity DOUBLE PRECISION NOT NULL,
                CONSTRAINT stock_pk PRIMARY KEY (id)
);


CREATE TABLE public.Basket (
                id INTEGER NOT NULL,
                id_pizza INTEGER NOT NULL,
                quantity INTEGER NOT NULL,
                CONSTRAINT basket_pk PRIMARY KEY (id)
);


CREATE TABLE public.PizzaOrder (
                id INTEGER NOT NULL,
                number INTEGER NOT NULL,
                timeOrder TIMESTAMP NOT NULL,
                status BOOLEAN NOT NULL,
                totalPrice DOUBLE PRECISION NOT NULL,
                CONSTRAINT pizzaorder_pk PRIMARY KEY (id)
);


CREATE TABLE public.StatusOrder (
                id INTEGER NOT NULL,
                delivery BOOLEAN NOT NULL,
                CONSTRAINT statusorder_pk PRIMARY KEY (id)
);


CREATE TABLE public.Delivery (
                id INTEGER NOT NULL,
                customerAdress VARCHAR NOT NULL,
                CONSTRAINT delivery_pk PRIMARY KEY (id)
);


ALTER TABLE public.Employee ADD CONSTRAINT pizzaiolo_employee_fk
FOREIGN KEY (id)
REFERENCES public.Pizzaiolo (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.PizzaOrder ADD CONSTRAINT pizzaiolo_pizzaorder_fk
FOREIGN KEY (id)
REFERENCES public.Pizzaiolo (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Employee ADD CONSTRAINT manager_employee_fk
FOREIGN KEY (id)
REFERENCES public.Manager (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Stock ADD CONSTRAINT manager_stock_fk
FOREIGN KEY (id)
REFERENCES public.Manager (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Delivery ADD CONSTRAINT customer_delivery_fk
FOREIGN KEY (id)
REFERENCES public.Customer (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Pizza ADD CONSTRAINT customer_pizza_fk
FOREIGN KEY (id)
REFERENCES public.Customer (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Basket ADD CONSTRAINT pizza_basket_fk
FOREIGN KEY (id_pizza)
REFERENCES public.Pizza (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Stock ADD CONSTRAINT pizza_stock_fk
FOREIGN KEY (id)
REFERENCES public.Pizza (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.PizzaOrder ADD CONSTRAINT basket_pizzaorder_fk
FOREIGN KEY (id)
REFERENCES public.Basket (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.StatusOrder ADD CONSTRAINT pizzaorder_statusorder_fk
FOREIGN KEY (id)
REFERENCES public.PizzaOrder (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Delivery ADD CONSTRAINT statusorder_delivery_fk
FOREIGN KEY (id)
REFERENCES public.StatusOrder (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
