-- Create trigger to decrease item quantity after adding a new order
CREATE TRIGGER after_insert_order
AFTER INSERT ON items
FOR EACH ROW
BEGIN
    UPDATE items
    SET quantity = quantity - NEW.quantity
    WHERE item_id = NEW.item_id;
END;

