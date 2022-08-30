"""tables

Revision ID: 6fd64ebca1dc
Revises: 
Create Date: 2022-08-24 20:44:03.473769

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '6fd64ebca1dc'
down_revision = None
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('room',
    sa.Column('room_id', sa.Integer(), nullable=False),
    sa.Column('time_for_move', sa.Integer(), nullable=False),
    sa.Column('small_blind_bet', sa.Integer(), nullable=False),
    sa.Column('max_players', sa.Integer(), nullable=False),
    sa.Column('is_private', sa.Boolean(), nullable=False),
    sa.Column('is_with_bots', sa.Boolean(), nullable=False),
    sa.PrimaryKeyConstraint('room_id')
    )
    op.create_table('user',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('login', sa.Text(), nullable=False),
    sa.Column('pwd', sa.Text(), nullable=False),
    sa.Column('coins', sa.Integer(), nullable=False),
    sa.Column('room_id', sa.Integer(), nullable=True),
    sa.ForeignKeyConstraint(['room_id'], ['room.room_id'], onupdate='CASCADE', ondelete='SET NULL'),
    sa.PrimaryKeyConstraint('id'),
    sa.UniqueConstraint('login')
    )
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('user')
    op.drop_table('room')
    # ### end Alembic commands ###