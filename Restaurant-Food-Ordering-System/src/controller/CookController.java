package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Item;
import Model.OrderDetails;
import Model.OrderMaster;
import constants.GlobalConstants;
import DAO.CookServices;

public class CookController extends BaseController {

	private static final long serialVersionUID = -4843668254577645314L;
	CookServices cService = new CookServices();

        @Override

        public void doPost(HttpServletRequest request, HttpServletResponse response) {
		String action = request.getParameter("action");
		doPostAction(action, request, response);
	}

        @Override
	public void doPostAction(String action, HttpServletRequest request, HttpServletResponse response) {
		try {
			String contextPath = request.getContextPath() + "/";
			
                    switch (action) {
                        case "addCategory":
                            String name = request.getParameter("cate");
                            if (!cService.isAlreadyExists(name)) {
                                if (cService.addCategory(name)) {
                                    GlobalConstants.MESSAGE = String.format(GlobalConstants.MSG_ADD_SUCCESS, name);
                                } else {
                                    GlobalConstants.MESSAGE = String.format(GlobalConstants.ERROR_ADD, name);
                                }
                            } else {
                                GlobalConstants.MESSAGE =String.format(GlobalConstants.ERROR_CAT_ALREADY, name);
                            }
                            GlobalConstants.JSP_PAGE = contextPath + "AddCategory.jsp";
                            response.sendRedirect(GlobalConstants.JSP_PAGE);
                            break;
                        case "addItem":
                            Item item = new Item(request.getParameter("itemName"),
                                    Integer.parseInt(request.getParameter("categoryId")),
                                    Integer.parseInt(request.getParameter("qnt")),
                                    request.getParameter("cost"));
                            System.out.println(item);
                            if (!cService.isItemAlreadyExists(item.getItemName())) {
                                if (cService.addItem(item)) {
                                    GlobalConstants.MESSAGE = String.format(GlobalConstants.MSG_ADD_SUCCESS, item.getItemName());
                                } else {
                                    GlobalConstants.MESSAGE = String.format(GlobalConstants.ERROR_ADD, item.getItemName());
                                }
                            } else {
                                GlobalConstants.MESSAGE = String.format(GlobalConstants.ERROR_CAT_ALREADY, item.getItemName());
                            }
                            GlobalConstants.JSP_PAGE = contextPath + "AddItem.jsp";
                            response.sendRedirect(GlobalConstants.JSP_PAGE);
                            break;
                        case "updateOStatus":
                            {
                                int orderId = Integer.parseInt(request.getParameter("orderId"));
                                String status = request.getParameter("status");
                                System.out.println("id = "+orderId+ "  status ="+status);
                                if(cService.updateOrderStatus(orderId, status))	{
                                    GlobalConstants.MESSAGE = GlobalConstants.MSG_UPDATE_SUCCESS;
                                }
                                else {
                                    GlobalConstants.MESSAGE = GlobalConstants.ERROR_UPDATE;
                                }
                                GlobalConstants.JSP_PAGE = contextPath+"ViewOrder.jsp";
                                response.sendRedirect(GlobalConstants.JSP_PAGE);
                                break;
                            }
                        case "updateItemtatus":
                            {
                                int orderId = Integer.parseInt(request.getParameter("orderId"));
                                int itemId = Integer.parseInt(request.getParameter("itemId"));
                                String status = request.getParameter("status");
                                System.out.println("id = "+orderId+ " ItemId = "+itemId+" status ="+status);
                                if(cService.updateItemStatus(orderId, itemId, status)) {
                                    GlobalConstants.MESSAGE = GlobalConstants.MSG_UPDATE_SUCCESS;
                                }
                                else {
                                    GlobalConstants.MESSAGE = GlobalConstants.ERROR_UPDATE;
                                }
                                GlobalConstants.JSP_PAGE = contextPath+"ViewOrder.jsp";
                                response.sendRedirect(GlobalConstants.JSP_PAGE);
                                break;
                            }
                        case "makeOrder":
                            {
                                System.out.println("In Make order");
                                String itemId[] = request.getParameterValues("ItemId");
                                String qnt[] = request.getParameterValues("orderQnt");
                                int catId = Integer.parseInt(request.getParameter("catId"));
                                String orderName = request.getParameter("orderName");
                                int tableNo = Integer.parseInt(request.getParameter("tableNo"));
                                String status = request.getParameter("status");
                                OrderMaster orderMaster = new OrderMaster();
                                orderMaster.setOrderName(orderName);
                                orderMaster.setOrderStat(OrderMaster.getOrderStat(status));
                                orderMaster.setTableNo(tableNo);
                                if(itemId != null && qnt != null) {
                                    if(cService.addOrder(orderMaster)) {
                                        int orderId = cService.getLastOrderId();
                                        
                                        ArrayList<OrderDetails> orderDetails = new ArrayList<OrderDetails>();
                                        OrderDetails od = new OrderDetails();
                                        
                                        for(int i=0;i<itemId.length;i++) {
                                            od.setOrderId(orderId);
                                            od.setItemId(Integer.parseInt(itemId[i]));
                                            od.setQnt(Integer.parseInt(qnt[i]));
                                            od.setOrderStat(OrderDetails.getOrderStat(OrderDetails.OrderStatus.STARTED.name()));
                                            orderDetails.add(od);
                                        }
                                        if(cService.addOrderedItems(orderDetails)) {
                                            GlobalConstants.MESSAGE = "Order Place Successfully";
                                        }
                                        else {
                                            GlobalConstants.MESSAGE = " Error in placing the order";
                                        }
                                    }
                                    else {
                                        GlobalConstants.MESSAGE = "Error in placing the order";
                                    }
                                }
                                else {
                                    GlobalConstants.MESSAGE = "Please select valid order";
                                }
                                GlobalConstants.JSP_PAGE = contextPath+"ViewItems.jsp?catId="+catId;
                                response.sendRedirect(GlobalConstants.JSP_PAGE);
                                break;
                            }
                        default:
                            break;
                    }

		} catch (Exception e) {
			System.out.println("Error in CookController - " + e);
		}
	}
}
