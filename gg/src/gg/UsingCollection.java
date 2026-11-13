package gg;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Scanner;

public class UsingCollection {
    static Scanner s = new Scanner(System.in);

    // 1. 전체 상품 객체들을 관리하는 ArrayList
    static ArrayList<Product> productList = new ArrayList<>();

    // 2. 상품 이름(String)을 Key로 하여 가격을 관리하는 HashMap
    static HashMap<String, Integer> priceMap = new HashMap<>();

    public static void main(String[] args) {

        System.out.println("******************");
        System.out.println("쇼핑몰에 오신 것을 환영합니다");
        System.out.println("******************\n");

        while (true) {
            System.out.println("무엇을 하시겠습니까?");
            System.out.println("1. 상품 목록 확인하기  2. 상품 추가하기  3. 상품 삭제하기  4. 상품 검색하기  5. 종료");
            System.out.print("선택: ");

            int choice = s.nextInt();

            if (choice == 5) {
                System.out.println("프로그램을 종료합니다.");
                break;
            }

            switch (choice) {
                case 1:
                    checkProductList();
                    break;
                case 2:
                    addProduct();
                    break;
                case 3:
                    deleteProduct();
                    break;
                case 4:
                    searchProduct();
                    break;
                default:
                    System.out.println("잘못된 입력입니다. 다시 선택해 주세요.");
            }
            System.out.println();
        }
        s.close();
    }

    public static void checkProductList() {
        if (productList.isEmpty()) {
            System.out.println("등록된 상품이 없습니다.");
            return;
        }

        System.out.println("=== 전체 상품 목록 (총 " + productList.size() + "개) ===");
        for (Product product : productList) {
            int price = priceMap.get(product.getName());
            System.out.println("상품명: " + product.getName() + " | 가격: " + price + "원");
        }
    }

    // 2. 상품 추가 (List와 Map 양쪽에 모두 추가)
    public static void addProduct() {
        System.out.print("추가할 상품 이름을 입력하세요: ");
        String name = s.next();

        System.out.print("상품 가격을 입력하세요: ");
        int price = s.nextInt();

        // ArrayList에 Product 객체 추가
        productList.add(new Product(name));
        
        // HashMap에 (상품 이름, 가격) 저장
        priceMap.put(name, price);

        System.out.println(name + " 상품이 성공적으로 추가되었습니다.");
    }


    public static void deleteProduct() {
        System.out.print("삭제할 상품 이름을 입력하세요: ");
        String name = s.next();

        // HashMap에 해당 상품 이름이 키로 존재하는지 확인
        if (priceMap.get(name) != null) {
            // 1. HashMap에서 삭제
            priceMap.remove(name);

            // 2. ArrayList에서도 해당 이름을 가진 Product 찾아서 삭제
            for (int i = 0; i < productList.size(); i++) {
                if (productList.get(i).getName().equals(name)) {
                    productList.remove(i);
                    break;
                }
            }
            System.out.println(name + " 상품이 삭제되었습니다.");
        } else {
            System.out.println(name + "은(는) 등록된 상품이 아닙니다.");
        }
    }

    // 4. 상품 검색
    public static void searchProduct() {
        System.out.print("검색할 상품 이름을 입력하세요: ");
        String name = s.next();

        if (priceMap.get(name) != null) {
            int price = priceMap.get(name);
            System.out.println("[검색 결과] 상품명: " + name + " | 가격: " + price + "원");
        } else {
            System.out.println(name + " 상품을 찾을 수 없습니다.");
        }
    }
}

class Product {
    private String name;

    public Product(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}