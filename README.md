# Aircraft Modelling Club App


The Aircraft Modelling Club App is a web application designed for aviation modelling enthusiasts, drone designers, and manufacturers. Built with [Java Spring](https://spring.io/), [Hibernate](https://hibernate.org/), and [MySQL](https://www.mysql.com/), it provides a platform to connect club members, facilitate the purchase and assembly of unmanned aerial vehicles (UAVs), and organize events like competitions and workshops. The app features an online store, user profiles, event management, and administrative tools, fostering a vibrant community for aviation hobbyists.

This project was developed as part of an academic internship at the Belarusian State University, Faculty of Mechanics and Mathematics, by Polina Aliyeva.

## Features

The application supports multiple user roles with tailored functionalities:

**Guest:**
* Register for an account.
* Log in to access the platform.

**User:**
* Browse and purchase UAVs and components from the product catalog.
* View seller profiles and contact details.
* Add/remove items to/from the cart and place orders.
* Track order status and view order history.
* Register for competitions and workshops.
* View participation history in events.

**Seller:**
* Add, edit, and remove products from the catalog.
* Manage order statuses (e.g., mark as shipped).
* View and fulfill customer orders.

**Administrator:**
* Manage users (block, delete, or change roles).
* Create, edit, and delete events (competitions, workshops).
* Oversee platform content and ensure compliance.

## Technologies

* **Backend**: Java Spring (Spring Boot, Spring MVC, Spring Security, Spring Data)
* **ORM**: Hibernate
* **Database**: MySQL
* **Server**: Apache Tomcat
* **Frontend**: HTML, CSS, Thymeleaf (for server-side templating)
* **Security**: BCrypt for password encryption
* **Build Tool**: Maven

## Database Design

The application uses a MySQL relational database to store structured data, such as user information, products, orders, and events. The database follows the Model-View-Controller (MVC) architecture, with Hibernate handling object-relational mapping (ORM) to simplify data interactions.

### Key Entities

The database includes the following core entities, each mapped to a table:
* **User:** Represents a platform user with roles (User, Seller, Administrator). Stores credentials, profile details, and role information.
* **Product**: Represents UAVs or components for sale. Includes title, description, price, and the seller (User).
* **Image**: Stores product images, linked to Product (one-to-many).
* **Cart**: Represents a user’s shopping cart, linked to User (one-to-one).
* **CartItem**: Represents items in a cart, linking Cart and Product (many-to-many).
* **Event**: Represents competitions or workshops, including title, date, and details.
* **EventParticipant**: Tracks user participation in events, linking User and Event (many-to-many).
* **Order**: Represents user orders, including status and linked to User.
* **OrderItem**: Represents items in an order, linking Order and Product.

![image](https://github.com/user-attachments/assets/650d3409-e2b0-4c0f-ac04-7d0d9dfcdd6b)


## Screenshots

Below are key interfaces of the application. 

**Login Page:** The entry point for users to access the platform.
<p align="center">
 <img height="350px" src="https://github.com/user-attachments/assets/79c1702e-b9e6-485e-aad4-fb0e124734d3" alt="qr"/>
 <img height="350px" src="https://github.com/user-attachments/assets/efd4d3e7-a5d6-4973-96e8-985b20ad4a02" alt="qr"/>
</p>

**Product Catalog:** Browse available UAVs and components.
<p align="center">
 <img width="500px" src="https://github.com/user-attachments/assets/48b2b0ef-3261-4d0f-8efd-bdf5ad3c901c" alt="qr"/>
</p>

**Adding to Cart:** GIF: Adding a product to the cart.
<p align="center">
 <img width="500px" src="https://github.com/user-attachments/assets/6eae18cc-902e-434c-a1e2-dc56574dabcc" alt="qr"/>
</p>

**User Profile:** View order and event history.
<p align="center">
 <img height="100px" src="https://github.com/user-attachments/assets/9881ae09-6c45-4ef4-aa57-0424c48dc064" alt="qr"/>
 <img height="100px" src="https://github.com/user-attachments/assets/a42b1264-b6ec-4a81-abf1-ab3cdd4cce28" alt="qr"/>
</p>

**Admin Panel:** Manage users and events.
<p align="center">
 <img width="600px" src="https://github.com/user-attachments/assets/1ae35dee-022e-478c-87f5-cd7cf97d3186" alt="qr"/>
 <img width="600px" src="https://github.com/user-attachments/assets/2822a0ba-22b6-4147-a031-d755a85d0023" alt="qr"/>
</p>

**Seller Product Management:** Adding new product to catalog.
<p align="center">
 <img width="500px" src="https://github.com/user-attachments/assets/0ec44c23-d9a3-4725-9fef-df9229dd3a28" alt="qr"/>
</p>

**Seller Order Management:** Updating order status
<p align="center">
 <img width="500px" src="https://github.com/user-attachments/assets/52764d57-3016-4d6f-bf28-2e139969a10f" alt="qr"/>
</p>

---
_Developed by Polina Aliyeva as part of an academic internship at Belarusian State University, 2024._
