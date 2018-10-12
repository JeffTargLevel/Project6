
CREATE TABLE public.ingredient (
                id INTEGER NOT NULL,
                CONSTRAINT ingredient_pk PRIMARY KEY (id)
);


CREATE TABLE public.stock (
                id INTEGER NOT NULL,
                id_ingredient INTEGER NOT NULL,
                quantity INTEGER NOT NULL,
                CONSTRAINT stock_pk PRIMARY KEY (id, id_ingredient)
);


CREATE TABLE public.recipe_instruction (
                id INTEGER NOT NULL,
                id_ingredient INTEGER NOT NULL,
                quantity INTEGER NOT NULL,
                CONSTRAINT recipe_instruction_pk PRIMARY KEY (id)
);


CREATE TABLE public.recipe (
                id INTEGER NOT NULL,
                recipe_instruction_id INTEGER NOT NULL,
                CONSTRAINT recipe_pk PRIMARY KEY (id)
);


CREATE TABLE public.pizza (
                id INTEGER NOT NULL,
                recipe_id INTEGER NOT NULL,
                CONSTRAINT pizza_pk PRIMARY KEY (id)
);


CREATE TABLE public.basket (
                id INTEGER NOT NULL,
                id_pizza INTEGER NOT NULL,
                quantity INTEGER NOT NULL,
                price NUMERIC NOT NULL,
                CONSTRAINT basket_pk PRIMARY KEY (id)
);


CREATE TABLE public.credentials (
                id INTEGER NOT NULL,
                user_type VARCHAR NOT NULL,
                username VARCHAR(100) NOT NULL,
                encrypted_password VARCHAR(25) NOT NULL,
                CONSTRAINT credentials_pk PRIMARY KEY (id)
);


CREATE TABLE public.pizza_order (
                id INTEGER NOT NULL,
                id_basket INTEGER NOT NULL,
                id_user INTEGER NOT NULL,
                CONSTRAINT pizza_order_pk PRIMARY KEY (id, id_basket)
);


CREATE TABLE public.user_adress (
                id INTEGER NOT NULL,
                id_user INTEGER NOT NULL,
                adress_delivery VARCHAR NOT NULL,
                CONSTRAINT user_adress_pk PRIMARY KEY (id, id_user)
);


CREATE TABLE public.delivery (
                id INTEGER NOT NULL,
                user_adress INTEGER NOT NULL,
                id_user INTEGER NOT NULL,
                id_pizza_order INTEGER NOT NULL,
                CONSTRAINT delivery_pk PRIMARY KEY (id)
);


ALTER TABLE public.recipe_instruction ADD CONSTRAINT ingredient_recipe_instruction_fk
FOREIGN KEY (id_ingredient)
REFERENCES public.ingredient (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.stock ADD CONSTRAINT ingredient_stock_fk
FOREIGN KEY (id_ingredient)
REFERENCES public.ingredient (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.recipe ADD CONSTRAINT recipe_instruction_recipe_fk
FOREIGN KEY (recipe_instruction_id)
REFERENCES public.recipe_instruction (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pizza ADD CONSTRAINT recipe_pizza_fk
FOREIGN KEY (recipe_id)
REFERENCES public.recipe (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.basket ADD CONSTRAINT pizza_basket_fk
FOREIGN KEY (id_pizza)
REFERENCES public.pizza (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pizza_order ADD CONSTRAINT basket_pizza_order_fk
FOREIGN KEY (id_basket)
REFERENCES public.basket (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.user_adress ADD CONSTRAINT credentials_user_adress_fk
FOREIGN KEY (id_user)
REFERENCES public.credentials (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pizza_order ADD CONSTRAINT credentials_pizza_order_fk
FOREIGN KEY (id_user)
REFERENCES public.credentials (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.delivery ADD CONSTRAINT pizza_order_delivery_fk
FOREIGN KEY (id, id_pizza_order)
REFERENCES public.pizza_order (id, id_basket)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.delivery ADD CONSTRAINT user_adress_delivery_fk
FOREIGN KEY (user_adress, id_user)
REFERENCES public.user_adress (id, id_user)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
