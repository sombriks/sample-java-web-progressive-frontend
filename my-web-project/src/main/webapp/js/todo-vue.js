window.todoVm = new Vue({
    data: {
        description: "",
        items: []
    },
    methods: {
        list() {
            this.items = []
            axios.get("todo-json").then(ret => {
                this.items = ret.items
            })
        },
        add() {
            axios.post("todo-json", {description: this.description}).then(_ => {
                this.list()
                this.description = ""
            })
        },
        save(item) {
            axios.post("todo-json", item).then(this.list)
        }
    },
    mounted() {
        this.list()
    }
}).$mount("#parent")
