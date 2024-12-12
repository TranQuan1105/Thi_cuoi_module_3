package com.example.demo.repository;

import com.example.demo.model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static final String SELECT_ALL_PRODUCTS = "select * from Product";
    private static final String ADD_PRODUCT = "INSERT INTO Product (productName, price, quantity, color, categoryName) VALUES (?, ?, ?, ?, ?)";
    private static final String DELETE_PRODUCT = "DELETE FROM Product WHERE productID = ?";

    @Override
    public List<Product> findAll() {
        List<Product> product = new ArrayList<>();
        BaseRepository baseRepository = new BaseRepository();
        Connection connection = baseRepository.getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT_ALL_PRODUCTS);
            while (resultSet.next()) {
                product.add(new Product(
                        resultSet.getInt("productID"),
                        resultSet.getString("productName"),
                        resultSet.getInt("price"),
                        resultSet.getInt("quantity"),
                        resultSet.getString("color"),
                        resultSet.getString("categoryName")
                ) );
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return product;
    }

    @Override
    public void addProduct(Product product) {
        BaseRepository baseRepository = new BaseRepository();
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(ADD_PRODUCT)) {
            preparedStatement.setString(1, product.getName());
            preparedStatement.setInt(2, product.getPrice());
            preparedStatement.setInt(3, product.getQuantity());
            preparedStatement.setString(4, product.getColor());
            preparedStatement.setString(5, product.getCategory());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteProduct(int id) {
        try (Connection connection = new BaseRepository().getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PRODUCT)) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
