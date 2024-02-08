const { PrismaClient } = require('@prisma/client')

const prisma = new PrismaClient()

const createUsers = async () => {
    await prisma.user.create ({
        data: {
            username: "MikeySky"
        }
    });

    await prisma.user.createMany({
        data: [
            {username: "TacoMack"},
            {username: "JustinTime"},
            {username: "BeFreeMeat"},
        ]
    });
}


const main = async () => {
    console.log(`seeding the database...`);
    await createUsers();
}

main()
  .then(async () => {
    await prisma.$disconnect()
  })
  .catch(async (e) => {
    console.error(e)
    await prisma.$disconnect()
    process.exit(1)
  })