import {createStore} from "vuex";
import product from "@/store/modules/product";
import category from "@/store/modules/category";
import auth from "@/store/modules/auth";
import reg from "@/store/modules/reg";
import upload from "@/store/modules/upload";

const store = createStore({
    modules: {
        product,
        category,
        auth,
        reg,
        upload
    }
})

export default store;